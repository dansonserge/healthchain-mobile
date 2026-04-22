import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../network/api_client.dart';
import '../storage/app_database.dart';

final syncWorkerProvider = Provider<SyncWorker>((ref) {
  final worker = SyncWorker(
    db: ref.watch(databaseProvider),
    dio: ref.watch(dioProvider),
  );
  // Optional: Auto-start listening on app boot
  worker.startListening();
  return worker;
});

class SyncWorker {
  final AppDatabase db;
  final Dio dio;
  bool _isProcessing = false;

  SyncWorker({required this.db, required this.dio});

  void startListening() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      if (results.isNotEmpty && results.first != ConnectivityResult.none) {
        // App just regained network access. Trigger queue wipe.
        processQueue();
      }
    });
  }

  Future<void> processQueue() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      final pendingItems = await db.pendingSyncItems;
      if (pendingItems.isEmpty) {
        _isProcessing = false;
        return;
      }

      for (final item in pendingItems) {
        if (item.retryCount >= 3) {
          // Temporarily skip permanently failed items until manually resolved by user
          continue;
        }

        final payload = jsonDecode(item.payload);

        try {
          late Response response;

          switch (item.mutationType) {
            case 'STOCK_ADJUST':
              response = await dio.post('/supply-chain/v1/inventory/adjust',
                  data: payload);
              break;
            case 'SCAN_RECEIVE':
              response = await dio.post('/supply-chain/v1/inventory/receive',
                  data: payload);
              break;
            default:
              throw Exception('Unknown mutation type: \${item.mutationType}');
          }

          if (response.statusCode == 200 || response.statusCode == 201) {
            await db.markSyncComplete(item.id);
          } else {
            await db.markSyncFailed(item.id,
                'Server returned \${response.statusCode}', item.retryCount);
          }
        } on DioException catch (e) {
          if (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.unknown) {
            // Still offline or bad network, bail out and wait for connectivity trigger again
            break;
          }
          await db.markSyncFailed(
              item.id, e.message ?? 'Unknown network error', item.retryCount);
        } catch (e) {
          await db.markSyncFailed(item.id, e.toString(), item.retryCount);
        }
      }
    } finally {
      _isProcessing = false;
    }
  }

  /// Entry point for the UI to queue an action offline
  Future<void> enqueueAction(
      {required String type, required Map<String, dynamic> data}) async {
    await db.enqueueMutation(type, jsonEncode(data));

    // Automatically attempt execution instantly incase we have internet
    processQueue();
  }
}
