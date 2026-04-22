import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../domain/iot_models.dart';

part 'iot_api.g.dart';

@RestApi()
abstract class IotApi {
  factory IotApi(Dio dio, {String baseUrl}) = _IotApi;

  @GET('/iot/devices')
  Future<List<IOTDevice>> getDevices();

  @GET('/iot/devices/{id}/telemetry')
  Future<List<TelemetryData>> getTelemetryHistory(
    @Path('id') String deviceId,
    @Query('start') String start,
    @Query('end') String end,
  );

  @PUT('/iot/incidents/{id}/resolve')
  Future<void> resolveIncident(
    @Path('id') String incidentId,
    @Body() Map<String, dynamic> resolution,
  );

  @GET('/notifications')
  Future<List<NotificationItem>> getNotifications(
    @Header('X-Institution-ID') String institutionId,
  );

  @PUT('/notifications/{id}/read')
  Future<void> markNotificationAsRead(
    @Path('id') String notificationId,
  );
}
