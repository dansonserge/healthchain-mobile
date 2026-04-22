import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/iot_api.dart';
import '../domain/iot_models.dart';
import '../../../core/network/api_client.dart';

final iotApiProvider = Provider<IotApi>((ref) {
  final dio = ref.watch(supplyChainDioProvider);
  return IotApi(dio);
});

final iotDevicesProvider = FutureProvider<List<IOTDevice>>((ref) async {
  final api = ref.watch(iotApiProvider);
  return api.getDevices();
});

final selectedDeviceIdProvider = StateProvider<String?>((ref) => null);

final telemetryHistoryProvider = FutureProvider.family<List<TelemetryData>, String>((ref, deviceId) async {
  final api = ref.watch(iotApiProvider);
  final end = DateTime.now();
  final start = end.subtract(const Duration(hours: 24));
  return api.getTelemetryHistory(
    deviceId, 
    start.toIso8601String(), 
    end.toIso8601String(),
  );
});

final notificationsProvider = FutureProvider.family<List<NotificationItem>, String>((ref, institutionId) async {
  final api = ref.watch(iotApiProvider);
  return api.getNotifications(institutionId);
});
