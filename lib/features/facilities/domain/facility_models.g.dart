// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Facility _$FacilityFromJson(Map<String, dynamic> json) => _Facility(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  address: json['address'] as String,
  phone: json['phone'] as String,
  isOpen: json['isOpen'] as bool? ?? false,
  distanceKm: (json['distanceKm'] as num?)?.toDouble() ?? 0.0,
  imageUrl: json['imageUrl'] as String?,
  lastRestockDate: json['lastRestockDate'] as String?,
);

Map<String, dynamic> _$FacilityToJson(_Facility instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'lat': instance.lat,
  'lng': instance.lng,
  'address': instance.address,
  'phone': instance.phone,
  'isOpen': instance.isOpen,
  'distanceKm': instance.distanceKm,
  'imageUrl': instance.imageUrl,
  'lastRestockDate': instance.lastRestockDate,
};
