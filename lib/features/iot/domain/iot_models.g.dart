// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iot_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IOTDevice _$IOTDeviceFromJson(Map<String, dynamic> json) => _IOTDevice(
  id: json['id'] as String,
  hardwareId: json['device_id'] as String,
  name: json['name'] as String,
  minTemp: (json['min_temp'] as num).toDouble(),
  maxTemp: (json['max_temp'] as num).toDouble(),
  status: json['status'] as String,
);

Map<String, dynamic> _$IOTDeviceToJson(_IOTDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device_id': instance.hardwareId,
      'name': instance.name,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'status': instance.status,
    };

_TelemetryData _$TelemetryDataFromJson(Map<String, dynamic> json) =>
    _TelemetryData(
      temperature: (json['temperature'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      isCritical: json['is_critical'] as bool,
    );

Map<String, dynamic> _$TelemetryDataToJson(_TelemetryData instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'timestamp': instance.timestamp.toIso8601String(),
      'is_critical': instance.isCritical,
    };

_NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) =>
    _NotificationItem(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$NotificationItemToJson(_NotificationItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'type': instance.type,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
    };
