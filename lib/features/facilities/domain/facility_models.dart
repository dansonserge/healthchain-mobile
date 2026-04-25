import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_models.freezed.dart';
part 'facility_models.g.dart';

@freezed
abstract class Facility with _$Facility {
  const factory Facility({
    required String id,
    required String name,
    required String type, // 'pharmacy', 'hospital', 'clinic'
    required double lat,
    required double lng,
    required String address,
    required String phone,
    @Default(false) bool isOpen,
    @Default(0.0) double distanceKm,
    String? imageUrl,
    String? lastRestockDate,
  }) = _Facility;

  factory Facility.fromJson(Map<String, dynamic> json) => _$FacilityFromJson(json);
}
