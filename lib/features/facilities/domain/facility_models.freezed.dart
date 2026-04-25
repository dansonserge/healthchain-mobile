// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Facility {

 String get id; String get name; String get type;// 'pharmacy', 'hospital', 'clinic'
 double get lat; double get lng; String get address; String get phone; bool get isOpen; double get distanceKm; String? get imageUrl; String? get lastRestockDate;
/// Create a copy of Facility
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityCopyWith<Facility> get copyWith => _$FacilityCopyWithImpl<Facility>(this as Facility, _$identity);

  /// Serializes this Facility to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Facility&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.lastRestockDate, lastRestockDate) || other.lastRestockDate == lastRestockDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,lat,lng,address,phone,isOpen,distanceKm,imageUrl,lastRestockDate);

@override
String toString() {
  return 'Facility(id: $id, name: $name, type: $type, lat: $lat, lng: $lng, address: $address, phone: $phone, isOpen: $isOpen, distanceKm: $distanceKm, imageUrl: $imageUrl, lastRestockDate: $lastRestockDate)';
}


}

/// @nodoc
abstract mixin class $FacilityCopyWith<$Res>  {
  factory $FacilityCopyWith(Facility value, $Res Function(Facility) _then) = _$FacilityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, double lat, double lng, String address, String phone, bool isOpen, double distanceKm, String? imageUrl, String? lastRestockDate
});




}
/// @nodoc
class _$FacilityCopyWithImpl<$Res>
    implements $FacilityCopyWith<$Res> {
  _$FacilityCopyWithImpl(this._self, this._then);

  final Facility _self;
  final $Res Function(Facility) _then;

/// Create a copy of Facility
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? lat = null,Object? lng = null,Object? address = null,Object? phone = null,Object? isOpen = null,Object? distanceKm = null,Object? imageUrl = freezed,Object? lastRestockDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,lastRestockDate: freezed == lastRestockDate ? _self.lastRestockDate : lastRestockDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Facility].
extension FacilityPatterns on Facility {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Facility value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Facility() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Facility value)  $default,){
final _that = this;
switch (_that) {
case _Facility():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Facility value)?  $default,){
final _that = this;
switch (_that) {
case _Facility() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  double lat,  double lng,  String address,  String phone,  bool isOpen,  double distanceKm,  String? imageUrl,  String? lastRestockDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Facility() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.lat,_that.lng,_that.address,_that.phone,_that.isOpen,_that.distanceKm,_that.imageUrl,_that.lastRestockDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  double lat,  double lng,  String address,  String phone,  bool isOpen,  double distanceKm,  String? imageUrl,  String? lastRestockDate)  $default,) {final _that = this;
switch (_that) {
case _Facility():
return $default(_that.id,_that.name,_that.type,_that.lat,_that.lng,_that.address,_that.phone,_that.isOpen,_that.distanceKm,_that.imageUrl,_that.lastRestockDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  double lat,  double lng,  String address,  String phone,  bool isOpen,  double distanceKm,  String? imageUrl,  String? lastRestockDate)?  $default,) {final _that = this;
switch (_that) {
case _Facility() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.lat,_that.lng,_that.address,_that.phone,_that.isOpen,_that.distanceKm,_that.imageUrl,_that.lastRestockDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Facility implements Facility {
  const _Facility({required this.id, required this.name, required this.type, required this.lat, required this.lng, required this.address, required this.phone, this.isOpen = false, this.distanceKm = 0.0, this.imageUrl, this.lastRestockDate});
  factory _Facility.fromJson(Map<String, dynamic> json) => _$FacilityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
// 'pharmacy', 'hospital', 'clinic'
@override final  double lat;
@override final  double lng;
@override final  String address;
@override final  String phone;
@override@JsonKey() final  bool isOpen;
@override@JsonKey() final  double distanceKm;
@override final  String? imageUrl;
@override final  String? lastRestockDate;

/// Create a copy of Facility
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityCopyWith<_Facility> get copyWith => __$FacilityCopyWithImpl<_Facility>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FacilityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Facility&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.lastRestockDate, lastRestockDate) || other.lastRestockDate == lastRestockDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,lat,lng,address,phone,isOpen,distanceKm,imageUrl,lastRestockDate);

@override
String toString() {
  return 'Facility(id: $id, name: $name, type: $type, lat: $lat, lng: $lng, address: $address, phone: $phone, isOpen: $isOpen, distanceKm: $distanceKm, imageUrl: $imageUrl, lastRestockDate: $lastRestockDate)';
}


}

/// @nodoc
abstract mixin class _$FacilityCopyWith<$Res> implements $FacilityCopyWith<$Res> {
  factory _$FacilityCopyWith(_Facility value, $Res Function(_Facility) _then) = __$FacilityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, double lat, double lng, String address, String phone, bool isOpen, double distanceKm, String? imageUrl, String? lastRestockDate
});




}
/// @nodoc
class __$FacilityCopyWithImpl<$Res>
    implements _$FacilityCopyWith<$Res> {
  __$FacilityCopyWithImpl(this._self, this._then);

  final _Facility _self;
  final $Res Function(_Facility) _then;

/// Create a copy of Facility
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? lat = null,Object? lng = null,Object? address = null,Object? phone = null,Object? isOpen = null,Object? distanceKm = null,Object? imageUrl = freezed,Object? lastRestockDate = freezed,}) {
  return _then(_Facility(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,lastRestockDate: freezed == lastRestockDate ? _self.lastRestockDate : lastRestockDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
