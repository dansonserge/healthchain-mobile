// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iot_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IOTDevice {
  String get id;
  @JsonKey(name: 'device_id')
  String get hardwareId;
  String get name;
  @JsonKey(name: 'min_temp')
  double get minTemp;
  @JsonKey(name: 'max_temp')
  double get maxTemp;
  String get status;

  /// Create a copy of IOTDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IOTDeviceCopyWith<IOTDevice> get copyWith =>
      _$IOTDeviceCopyWithImpl<IOTDevice>(this as IOTDevice, _$identity);

  /// Serializes this IOTDevice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IOTDevice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hardwareId, hardwareId) ||
                other.hardwareId == hardwareId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minTemp, minTemp) || other.minTemp == minTemp) &&
            (identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, hardwareId, name, minTemp, maxTemp, status);

  @override
  String toString() {
    return 'IOTDevice(id: $id, hardwareId: $hardwareId, name: $name, minTemp: $minTemp, maxTemp: $maxTemp, status: $status)';
  }
}

/// @nodoc
abstract mixin class $IOTDeviceCopyWith<$Res> {
  factory $IOTDeviceCopyWith(IOTDevice value, $Res Function(IOTDevice) _then) =
      _$IOTDeviceCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'device_id') String hardwareId,
      String name,
      @JsonKey(name: 'min_temp') double minTemp,
      @JsonKey(name: 'max_temp') double maxTemp,
      String status});
}

/// @nodoc
class _$IOTDeviceCopyWithImpl<$Res> implements $IOTDeviceCopyWith<$Res> {
  _$IOTDeviceCopyWithImpl(this._self, this._then);

  final IOTDevice _self;
  final $Res Function(IOTDevice) _then;

  /// Create a copy of IOTDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hardwareId = null,
    Object? name = null,
    Object? minTemp = null,
    Object? maxTemp = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hardwareId: null == hardwareId
          ? _self.hardwareId
          : hardwareId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minTemp: null == minTemp
          ? _self.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemp: null == maxTemp
          ? _self.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [IOTDevice].
extension IOTDevicePatterns on IOTDevice {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_IOTDevice value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IOTDevice() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_IOTDevice value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IOTDevice():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_IOTDevice value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IOTDevice() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'device_id') String hardwareId,
            String name,
            @JsonKey(name: 'min_temp') double minTemp,
            @JsonKey(name: 'max_temp') double maxTemp,
            String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IOTDevice() when $default != null:
        return $default(_that.id, _that.hardwareId, _that.name, _that.minTemp,
            _that.maxTemp, _that.status);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'device_id') String hardwareId,
            String name,
            @JsonKey(name: 'min_temp') double minTemp,
            @JsonKey(name: 'max_temp') double maxTemp,
            String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IOTDevice():
        return $default(_that.id, _that.hardwareId, _that.name, _that.minTemp,
            _that.maxTemp, _that.status);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            @JsonKey(name: 'device_id') String hardwareId,
            String name,
            @JsonKey(name: 'min_temp') double minTemp,
            @JsonKey(name: 'max_temp') double maxTemp,
            String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IOTDevice() when $default != null:
        return $default(_that.id, _that.hardwareId, _that.name, _that.minTemp,
            _that.maxTemp, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IOTDevice implements IOTDevice {
  const _IOTDevice(
      {required this.id,
      @JsonKey(name: 'device_id') required this.hardwareId,
      required this.name,
      @JsonKey(name: 'min_temp') required this.minTemp,
      @JsonKey(name: 'max_temp') required this.maxTemp,
      required this.status});
  factory _IOTDevice.fromJson(Map<String, dynamic> json) =>
      _$IOTDeviceFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'device_id')
  final String hardwareId;
  @override
  final String name;
  @override
  @JsonKey(name: 'min_temp')
  final double minTemp;
  @override
  @JsonKey(name: 'max_temp')
  final double maxTemp;
  @override
  final String status;

  /// Create a copy of IOTDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IOTDeviceCopyWith<_IOTDevice> get copyWith =>
      __$IOTDeviceCopyWithImpl<_IOTDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IOTDeviceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IOTDevice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hardwareId, hardwareId) ||
                other.hardwareId == hardwareId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minTemp, minTemp) || other.minTemp == minTemp) &&
            (identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, hardwareId, name, minTemp, maxTemp, status);

  @override
  String toString() {
    return 'IOTDevice(id: $id, hardwareId: $hardwareId, name: $name, minTemp: $minTemp, maxTemp: $maxTemp, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$IOTDeviceCopyWith<$Res>
    implements $IOTDeviceCopyWith<$Res> {
  factory _$IOTDeviceCopyWith(
          _IOTDevice value, $Res Function(_IOTDevice) _then) =
      __$IOTDeviceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'device_id') String hardwareId,
      String name,
      @JsonKey(name: 'min_temp') double minTemp,
      @JsonKey(name: 'max_temp') double maxTemp,
      String status});
}

/// @nodoc
class __$IOTDeviceCopyWithImpl<$Res> implements _$IOTDeviceCopyWith<$Res> {
  __$IOTDeviceCopyWithImpl(this._self, this._then);

  final _IOTDevice _self;
  final $Res Function(_IOTDevice) _then;

  /// Create a copy of IOTDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? hardwareId = null,
    Object? name = null,
    Object? minTemp = null,
    Object? maxTemp = null,
    Object? status = null,
  }) {
    return _then(_IOTDevice(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      hardwareId: null == hardwareId
          ? _self.hardwareId
          : hardwareId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      minTemp: null == minTemp
          ? _self.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemp: null == maxTemp
          ? _self.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$TelemetryData {
  double get temperature;
  DateTime get timestamp;
  @JsonKey(name: 'is_critical')
  bool get isCritical;

  /// Create a copy of TelemetryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TelemetryDataCopyWith<TelemetryData> get copyWith =>
      _$TelemetryDataCopyWithImpl<TelemetryData>(
          this as TelemetryData, _$identity);

  /// Serializes this TelemetryData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TelemetryData &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isCritical, isCritical) ||
                other.isCritical == isCritical));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, temperature, timestamp, isCritical);

  @override
  String toString() {
    return 'TelemetryData(temperature: $temperature, timestamp: $timestamp, isCritical: $isCritical)';
  }
}

/// @nodoc
abstract mixin class $TelemetryDataCopyWith<$Res> {
  factory $TelemetryDataCopyWith(
          TelemetryData value, $Res Function(TelemetryData) _then) =
      _$TelemetryDataCopyWithImpl;
  @useResult
  $Res call(
      {double temperature,
      DateTime timestamp,
      @JsonKey(name: 'is_critical') bool isCritical});
}

/// @nodoc
class _$TelemetryDataCopyWithImpl<$Res>
    implements $TelemetryDataCopyWith<$Res> {
  _$TelemetryDataCopyWithImpl(this._self, this._then);

  final TelemetryData _self;
  final $Res Function(TelemetryData) _then;

  /// Create a copy of TelemetryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? timestamp = null,
    Object? isCritical = null,
  }) {
    return _then(_self.copyWith(
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCritical: null == isCritical
          ? _self.isCritical
          : isCritical // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [TelemetryData].
extension TelemetryDataPatterns on TelemetryData {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TelemetryData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TelemetryData() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TelemetryData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TelemetryData():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TelemetryData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TelemetryData() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double temperature, DateTime timestamp,
            @JsonKey(name: 'is_critical') bool isCritical)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TelemetryData() when $default != null:
        return $default(_that.temperature, _that.timestamp, _that.isCritical);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double temperature, DateTime timestamp,
            @JsonKey(name: 'is_critical') bool isCritical)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TelemetryData():
        return $default(_that.temperature, _that.timestamp, _that.isCritical);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double temperature, DateTime timestamp,
            @JsonKey(name: 'is_critical') bool isCritical)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TelemetryData() when $default != null:
        return $default(_that.temperature, _that.timestamp, _that.isCritical);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TelemetryData implements TelemetryData {
  const _TelemetryData(
      {required this.temperature,
      required this.timestamp,
      @JsonKey(name: 'is_critical') required this.isCritical});
  factory _TelemetryData.fromJson(Map<String, dynamic> json) =>
      _$TelemetryDataFromJson(json);

  @override
  final double temperature;
  @override
  final DateTime timestamp;
  @override
  @JsonKey(name: 'is_critical')
  final bool isCritical;

  /// Create a copy of TelemetryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TelemetryDataCopyWith<_TelemetryData> get copyWith =>
      __$TelemetryDataCopyWithImpl<_TelemetryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TelemetryDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TelemetryData &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isCritical, isCritical) ||
                other.isCritical == isCritical));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, temperature, timestamp, isCritical);

  @override
  String toString() {
    return 'TelemetryData(temperature: $temperature, timestamp: $timestamp, isCritical: $isCritical)';
  }
}

/// @nodoc
abstract mixin class _$TelemetryDataCopyWith<$Res>
    implements $TelemetryDataCopyWith<$Res> {
  factory _$TelemetryDataCopyWith(
          _TelemetryData value, $Res Function(_TelemetryData) _then) =
      __$TelemetryDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double temperature,
      DateTime timestamp,
      @JsonKey(name: 'is_critical') bool isCritical});
}

/// @nodoc
class __$TelemetryDataCopyWithImpl<$Res>
    implements _$TelemetryDataCopyWith<$Res> {
  __$TelemetryDataCopyWithImpl(this._self, this._then);

  final _TelemetryData _self;
  final $Res Function(_TelemetryData) _then;

  /// Create a copy of TelemetryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? temperature = null,
    Object? timestamp = null,
    Object? isCritical = null,
  }) {
    return _then(_TelemetryData(
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCritical: null == isCritical
          ? _self.isCritical
          : isCritical // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$NotificationItem {
  String get id;
  String get title;
  String get message;
  String get type;
  String get status;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationItemCopyWith<NotificationItem> get copyWith =>
      _$NotificationItemCopyWithImpl<NotificationItem>(
          this as NotificationItem, _$identity);

  /// Serializes this NotificationItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, message, type, status, createdAt);

  @override
  String toString() {
    return 'NotificationItem(id: $id, title: $title, message: $message, type: $type, status: $status, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $NotificationItemCopyWith<$Res> {
  factory $NotificationItemCopyWith(
          NotificationItem value, $Res Function(NotificationItem) _then) =
      _$NotificationItemCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      String type,
      String status,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$NotificationItemCopyWithImpl<$Res>
    implements $NotificationItemCopyWith<$Res> {
  _$NotificationItemCopyWithImpl(this._self, this._then);

  final NotificationItem _self;
  final $Res Function(NotificationItem) _then;

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationItem].
extension NotificationItemPatterns on NotificationItem {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NotificationItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationItem() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NotificationItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationItem():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NotificationItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationItem() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title, String message, String type,
            String status, @JsonKey(name: 'created_at') DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationItem() when $default != null:
        return $default(_that.id, _that.title, _that.message, _that.type,
            _that.status, _that.createdAt);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title, String message, String type,
            String status, @JsonKey(name: 'created_at') DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationItem():
        return $default(_that.id, _that.title, _that.message, _that.type,
            _that.status, _that.createdAt);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String title, String message, String type,
            String status, @JsonKey(name: 'created_at') DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationItem() when $default != null:
        return $default(_that.id, _that.title, _that.message, _that.type,
            _that.status, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationItem implements NotificationItem {
  const _NotificationItem(
      {required this.id,
      required this.title,
      required this.message,
      required this.type,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt});
  factory _NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String message;
  @override
  final String type;
  @override
  final String status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationItemCopyWith<_NotificationItem> get copyWith =>
      __$NotificationItemCopyWithImpl<_NotificationItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, message, type, status, createdAt);

  @override
  String toString() {
    return 'NotificationItem(id: $id, title: $title, message: $message, type: $type, status: $status, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$NotificationItemCopyWith<$Res>
    implements $NotificationItemCopyWith<$Res> {
  factory _$NotificationItemCopyWith(
          _NotificationItem value, $Res Function(_NotificationItem) _then) =
      __$NotificationItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      String type,
      String status,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$NotificationItemCopyWithImpl<$Res>
    implements _$NotificationItemCopyWith<$Res> {
  __$NotificationItemCopyWithImpl(this._self, this._then);

  final _NotificationItem _self;
  final $Res Function(_NotificationItem) _then;

  /// Create a copy of NotificationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_NotificationItem(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
