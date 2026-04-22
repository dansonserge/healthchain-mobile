import 'package:freezed_annotation/freezed_annotation.dart';

part 'iot_models.freezed.dart';
part 'iot_models.g.dart';

@freezed
class IOTDevice with _$IOTDevice {
  const factory IOTDevice({
    required String id,
    @JsonKey(name: 'device_id') required String hardwareId,
    required String name,
    @JsonKey(name: 'min_temp') required double minTemp,
    @JsonKey(name: 'max_temp') required double maxTemp,
    required String status, // optimal, warning, critical, inactive
  }) = _IOTDevice;

  factory IOTDevice.fromJson(Map<String, dynamic> json) => _$IOTDeviceFromJson(json);
}

@freezed
class TelemetryData with _$TelemetryData {
  const factory TelemetryData({
    required double temperature,
    required DateTime timestamp,
    @JsonKey(name: 'is_critical') required bool isCritical,
  }) = _TelemetryData;

  factory TelemetryData.fromJson(Map<String, dynamic> json) => _$TelemetryDataFromJson(json);
}

@freezed
class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required String id,
    required String title,
    required String message,
    required String type,
    required String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, dynamic> json) => _$NotificationItemFromJson(json);
}
