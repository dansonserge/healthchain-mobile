import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [SyncQueueItems, CachedInventoryItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // -- DAOs for Sync Queue --
  Future<List<SyncQueueItem>> get pendingSyncItems => 
      (select(syncQueueItems)..where((t) => t.status.equals('PENDING') | t.status.equals('FAILED'))
                             ..orderBy([(t) => OrderingTerm(expression: t.createdAt)])).get();

  Future<int> enqueueMutation(String type, String payload) {
    return into(syncQueueItems).insert(SyncQueueItemsCompanion.insert(
      mutationType: type,
      payload: payload,
    ));
  }

  Future<void> markSyncComplete(int id) {
    return (update(syncQueueItems)..where((t) => t.id.equals(id)))
        .write(const SyncQueueItemsCompanion(status: Value('COMPLETED')));
  }

  Future<void> markSyncFailed(int id, String error, int currentRetries) {
    return (update(syncQueueItems)..where((t) => t.id.equals(id)))
        .write(SyncQueueItemsCompanion(
          status: const Value('FAILED'),
          lastError: Value(error),
          retryCount: Value(currentRetries + 1),
        ));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'healthchain.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});
