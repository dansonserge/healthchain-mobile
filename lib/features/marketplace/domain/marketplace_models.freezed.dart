// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketplaceProduct {
  @JsonKey(name: 'product_id')
  String get id;
  @JsonKey(name: 'product_name')
  String get name;
  @JsonKey(name: 'product_image_url')
  String? get imageUrl;
  @JsonKey(name: 'cheapest_price')
  double get price;
  String get currency;
  @JsonKey(name: 'seller_name')
  String get sellerName;
  @JsonKey(name: 'seller_id')
  String get sellerId;
  @JsonKey(name: 'distance_km')
  double get distanceKm;
  @JsonKey(name: 'batch_number')
  String? get batchNumber;
  @JsonKey(name: 'expiry_date')
  String? get expiryDate;
  @JsonKey(name: 'category_names')
  List<String> get categories;

  /// Create a copy of MarketplaceProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MarketplaceProductCopyWith<MarketplaceProduct> get copyWith =>
      _$MarketplaceProductCopyWithImpl<MarketplaceProduct>(
          this as MarketplaceProduct, _$identity);

  /// Serializes this MarketplaceProduct to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarketplaceProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      imageUrl,
      price,
      currency,
      sellerName,
      sellerId,
      distanceKm,
      batchNumber,
      expiryDate,
      const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'MarketplaceProduct(id: $id, name: $name, imageUrl: $imageUrl, price: $price, currency: $currency, sellerName: $sellerName, sellerId: $sellerId, distanceKm: $distanceKm, batchNumber: $batchNumber, expiryDate: $expiryDate, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $MarketplaceProductCopyWith<$Res> {
  factory $MarketplaceProductCopyWith(
          MarketplaceProduct value, $Res Function(MarketplaceProduct) _then) =
      _$MarketplaceProductCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String id,
      @JsonKey(name: 'product_name') String name,
      @JsonKey(name: 'product_image_url') String? imageUrl,
      @JsonKey(name: 'cheapest_price') double price,
      String currency,
      @JsonKey(name: 'seller_name') String sellerName,
      @JsonKey(name: 'seller_id') String sellerId,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'batch_number') String? batchNumber,
      @JsonKey(name: 'expiry_date') String? expiryDate,
      @JsonKey(name: 'category_names') List<String> categories});
}

/// @nodoc
class _$MarketplaceProductCopyWithImpl<$Res>
    implements $MarketplaceProductCopyWith<$Res> {
  _$MarketplaceProductCopyWithImpl(this._self, this._then);

  final MarketplaceProduct _self;
  final $Res Function(MarketplaceProduct) _then;

  /// Create a copy of MarketplaceProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? price = null,
    Object? currency = null,
    Object? sellerName = null,
    Object? sellerId = null,
    Object? distanceKm = null,
    Object? batchNumber = freezed,
    Object? expiryDate = freezed,
    Object? categories = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      batchNumber: freezed == batchNumber
          ? _self.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MarketplaceProduct].
extension MarketplaceProductPatterns on MarketplaceProduct {
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
    TResult Function(_MarketplaceProduct value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MarketplaceProduct() when $default != null:
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
    TResult Function(_MarketplaceProduct value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarketplaceProduct():
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
    TResult? Function(_MarketplaceProduct value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarketplaceProduct() when $default != null:
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
            @JsonKey(name: 'product_id') String id,
            @JsonKey(name: 'product_name') String name,
            @JsonKey(name: 'product_image_url') String? imageUrl,
            @JsonKey(name: 'cheapest_price') double price,
            String currency,
            @JsonKey(name: 'seller_name') String sellerName,
            @JsonKey(name: 'seller_id') String sellerId,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'batch_number') String? batchNumber,
            @JsonKey(name: 'expiry_date') String? expiryDate,
            @JsonKey(name: 'category_names') List<String> categories)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MarketplaceProduct() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.imageUrl,
            _that.price,
            _that.currency,
            _that.sellerName,
            _that.sellerId,
            _that.distanceKm,
            _that.batchNumber,
            _that.expiryDate,
            _that.categories);
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
            @JsonKey(name: 'product_id') String id,
            @JsonKey(name: 'product_name') String name,
            @JsonKey(name: 'product_image_url') String? imageUrl,
            @JsonKey(name: 'cheapest_price') double price,
            String currency,
            @JsonKey(name: 'seller_name') String sellerName,
            @JsonKey(name: 'seller_id') String sellerId,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'batch_number') String? batchNumber,
            @JsonKey(name: 'expiry_date') String? expiryDate,
            @JsonKey(name: 'category_names') List<String> categories)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarketplaceProduct():
        return $default(
            _that.id,
            _that.name,
            _that.imageUrl,
            _that.price,
            _that.currency,
            _that.sellerName,
            _that.sellerId,
            _that.distanceKm,
            _that.batchNumber,
            _that.expiryDate,
            _that.categories);
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
            @JsonKey(name: 'product_id') String id,
            @JsonKey(name: 'product_name') String name,
            @JsonKey(name: 'product_image_url') String? imageUrl,
            @JsonKey(name: 'cheapest_price') double price,
            String currency,
            @JsonKey(name: 'seller_name') String sellerName,
            @JsonKey(name: 'seller_id') String sellerId,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'batch_number') String? batchNumber,
            @JsonKey(name: 'expiry_date') String? expiryDate,
            @JsonKey(name: 'category_names') List<String> categories)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarketplaceProduct() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.imageUrl,
            _that.price,
            _that.currency,
            _that.sellerName,
            _that.sellerId,
            _that.distanceKm,
            _that.batchNumber,
            _that.expiryDate,
            _that.categories);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MarketplaceProduct implements MarketplaceProduct {
  const _MarketplaceProduct(
      {@JsonKey(name: 'product_id') required this.id,
      @JsonKey(name: 'product_name') required this.name,
      @JsonKey(name: 'product_image_url') this.imageUrl,
      @JsonKey(name: 'cheapest_price') required this.price,
      required this.currency,
      @JsonKey(name: 'seller_name') required this.sellerName,
      @JsonKey(name: 'seller_id') required this.sellerId,
      @JsonKey(name: 'distance_km') required this.distanceKm,
      @JsonKey(name: 'batch_number') this.batchNumber,
      @JsonKey(name: 'expiry_date') this.expiryDate,
      @JsonKey(name: 'category_names')
      final List<String> categories = const []})
      : _categories = categories;
  factory _MarketplaceProduct.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceProductFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String id;
  @override
  @JsonKey(name: 'product_name')
  final String name;
  @override
  @JsonKey(name: 'product_image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'cheapest_price')
  final double price;
  @override
  final String currency;
  @override
  @JsonKey(name: 'seller_name')
  final String sellerName;
  @override
  @JsonKey(name: 'seller_id')
  final String sellerId;
  @override
  @JsonKey(name: 'distance_km')
  final double distanceKm;
  @override
  @JsonKey(name: 'batch_number')
  final String? batchNumber;
  @override
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;
  final List<String> _categories;
  @override
  @JsonKey(name: 'category_names')
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of MarketplaceProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MarketplaceProductCopyWith<_MarketplaceProduct> get copyWith =>
      __$MarketplaceProductCopyWithImpl<_MarketplaceProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MarketplaceProductToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MarketplaceProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      imageUrl,
      price,
      currency,
      sellerName,
      sellerId,
      distanceKm,
      batchNumber,
      expiryDate,
      const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'MarketplaceProduct(id: $id, name: $name, imageUrl: $imageUrl, price: $price, currency: $currency, sellerName: $sellerName, sellerId: $sellerId, distanceKm: $distanceKm, batchNumber: $batchNumber, expiryDate: $expiryDate, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$MarketplaceProductCopyWith<$Res>
    implements $MarketplaceProductCopyWith<$Res> {
  factory _$MarketplaceProductCopyWith(
          _MarketplaceProduct value, $Res Function(_MarketplaceProduct) _then) =
      __$MarketplaceProductCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String id,
      @JsonKey(name: 'product_name') String name,
      @JsonKey(name: 'product_image_url') String? imageUrl,
      @JsonKey(name: 'cheapest_price') double price,
      String currency,
      @JsonKey(name: 'seller_name') String sellerName,
      @JsonKey(name: 'seller_id') String sellerId,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'batch_number') String? batchNumber,
      @JsonKey(name: 'expiry_date') String? expiryDate,
      @JsonKey(name: 'category_names') List<String> categories});
}

/// @nodoc
class __$MarketplaceProductCopyWithImpl<$Res>
    implements _$MarketplaceProductCopyWith<$Res> {
  __$MarketplaceProductCopyWithImpl(this._self, this._then);

  final _MarketplaceProduct _self;
  final $Res Function(_MarketplaceProduct) _then;

  /// Create a copy of MarketplaceProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? price = null,
    Object? currency = null,
    Object? sellerName = null,
    Object? sellerId = null,
    Object? distanceKm = null,
    Object? batchNumber = freezed,
    Object? expiryDate = freezed,
    Object? categories = null,
  }) {
    return _then(_MarketplaceProduct(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      batchNumber: freezed == batchNumber
          ? _self.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
mixin _$MarketplaceListing {
  @JsonKey(name: 'listing_id')
  String get id;
  @JsonKey(name: 'inventory_id')
  String get inventoryId;
  @JsonKey(name: 'product_name')
  String get productName;
  @JsonKey(name: 'product_image')
  String? get productImage;
  @JsonKey(name: 'seller_institution_id')
  String get sellerId;
  @JsonKey(name: 'seller_name')
  String get sellerName;
  @JsonKey(name: 'seller_logo')
  String? get sellerLogo;
  @JsonKey(name: 'seller_lat')
  double get lat;
  @JsonKey(name: 'seller_lng')
  double get lng;
  double get price;
  String get currency;
  @JsonKey(name: 'quantity_listed')
  int get quantity;
  @JsonKey(name: 'distance_km')
  double get distanceKm;
  @JsonKey(name: 'batch_number')
  String? get batchNumber;
  @JsonKey(name: 'expiry_date')
  String? get expiryDate;

  /// Create a copy of MarketplaceListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MarketplaceListingCopyWith<MarketplaceListing> get copyWith =>
      _$MarketplaceListingCopyWithImpl<MarketplaceListing>(
          this as MarketplaceListing, _$identity);

  /// Serializes this MarketplaceListing to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarketplaceListing &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inventoryId, inventoryId) ||
                other.inventoryId == inventoryId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.sellerLogo, sellerLogo) ||
                other.sellerLogo == sellerLogo) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      inventoryId,
      productName,
      productImage,
      sellerId,
      sellerName,
      sellerLogo,
      lat,
      lng,
      price,
      currency,
      quantity,
      distanceKm,
      batchNumber,
      expiryDate);

  @override
  String toString() {
    return 'MarketplaceListing(id: $id, inventoryId: $inventoryId, productName: $productName, productImage: $productImage, sellerId: $sellerId, sellerName: $sellerName, sellerLogo: $sellerLogo, lat: $lat, lng: $lng, price: $price, currency: $currency, quantity: $quantity, distanceKm: $distanceKm, batchNumber: $batchNumber, expiryDate: $expiryDate)';
  }
}

/// @nodoc
abstract mixin class $MarketplaceListingCopyWith<$Res> {
  factory $MarketplaceListingCopyWith(
          MarketplaceListing value, $Res Function(MarketplaceListing) _then) =
      _$MarketplaceListingCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'listing_id') String id,
      @JsonKey(name: 'inventory_id') String inventoryId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_image') String? productImage,
      @JsonKey(name: 'seller_institution_id') String sellerId,
      @JsonKey(name: 'seller_name') String sellerName,
      @JsonKey(name: 'seller_logo') String? sellerLogo,
      @JsonKey(name: 'seller_lat') double lat,
      @JsonKey(name: 'seller_lng') double lng,
      double price,
      String currency,
      @JsonKey(name: 'quantity_listed') int quantity,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'batch_number') String? batchNumber,
      @JsonKey(name: 'expiry_date') String? expiryDate});
}

/// @nodoc
class _$MarketplaceListingCopyWithImpl<$Res>
    implements $MarketplaceListingCopyWith<$Res> {
  _$MarketplaceListingCopyWithImpl(this._self, this._then);

  final MarketplaceListing _self;
  final $Res Function(MarketplaceListing) _then;

  /// Create a copy of MarketplaceListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? inventoryId = null,
    Object? productName = null,
    Object? productImage = freezed,
    Object? sellerId = null,
    Object? sellerName = null,
    Object? sellerLogo = freezed,
    Object? lat = null,
    Object? lng = null,
    Object? price = null,
    Object? currency = null,
    Object? quantity = null,
    Object? distanceKm = null,
    Object? batchNumber = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      inventoryId: null == inventoryId
          ? _self.inventoryId
          : inventoryId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: freezed == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerLogo: freezed == sellerLogo
          ? _self.sellerLogo
          : sellerLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      batchNumber: freezed == batchNumber
          ? _self.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MarketplaceListing].
extension MarketplaceListingPatterns on MarketplaceListing {
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
    TResult Function(_MarketplaceListing value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MarketplaceListing() when $default != null:
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
    TResult Function(_MarketplaceListing value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarketplaceListing():
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
    TResult? Function(_MarketplaceListing value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarketplaceListing() when $default != null:
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
            @JsonKey(name: 'listing_id') String id,
            @JsonKey(name: 'inventory_id') String inventoryId,
            @JsonKey(name: 'product_name') String productName,
            @JsonKey(name: 'product_image') String? productImage,
            @JsonKey(name: 'seller_institution_id') String sellerId,
            @JsonKey(name: 'seller_name') String sellerName,
            @JsonKey(name: 'seller_logo') String? sellerLogo,
            @JsonKey(name: 'seller_lat') double lat,
            @JsonKey(name: 'seller_lng') double lng,
            double price,
            String currency,
            @JsonKey(name: 'quantity_listed') int quantity,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'batch_number') String? batchNumber,
            @JsonKey(name: 'expiry_date') String? expiryDate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MarketplaceListing() when $default != null:
        return $default(
            _that.id,
            _that.inventoryId,
            _that.productName,
            _that.productImage,
            _that.sellerId,
            _that.sellerName,
            _that.sellerLogo,
            _that.lat,
            _that.lng,
            _that.price,
            _that.currency,
            _that.quantity,
            _that.distanceKm,
            _that.batchNumber,
            _that.expiryDate);
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
            @JsonKey(name: 'listing_id') String id,
            @JsonKey(name: 'inventory_id') String inventoryId,
            @JsonKey(name: 'product_name') String productName,
            @JsonKey(name: 'product_image') String? productImage,
            @JsonKey(name: 'seller_institution_id') String sellerId,
            @JsonKey(name: 'seller_name') String sellerName,
            @JsonKey(name: 'seller_logo') String? sellerLogo,
            @JsonKey(name: 'seller_lat') double lat,
            @JsonKey(name: 'seller_lng') double lng,
            double price,
            String currency,
            @JsonKey(name: 'quantity_listed') int quantity,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'batch_number') String? batchNumber,
            @JsonKey(name: 'expiry_date') String? expiryDate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarketplaceListing():
        return $default(
            _that.id,
            _that.inventoryId,
            _that.productName,
            _that.productImage,
            _that.sellerId,
            _that.sellerName,
            _that.sellerLogo,
            _that.lat,
            _that.lng,
            _that.price,
            _that.currency,
            _that.quantity,
            _that.distanceKm,
            _that.batchNumber,
            _that.expiryDate);
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
            @JsonKey(name: 'listing_id') String id,
            @JsonKey(name: 'inventory_id') String inventoryId,
            @JsonKey(name: 'product_name') String productName,
            @JsonKey(name: 'product_image') String? productImage,
            @JsonKey(name: 'seller_institution_id') String sellerId,
            @JsonKey(name: 'seller_name') String sellerName,
            @JsonKey(name: 'seller_logo') String? sellerLogo,
            @JsonKey(name: 'seller_lat') double lat,
            @JsonKey(name: 'seller_lng') double lng,
            double price,
            String currency,
            @JsonKey(name: 'quantity_listed') int quantity,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'batch_number') String? batchNumber,
            @JsonKey(name: 'expiry_date') String? expiryDate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MarketplaceListing() when $default != null:
        return $default(
            _that.id,
            _that.inventoryId,
            _that.productName,
            _that.productImage,
            _that.sellerId,
            _that.sellerName,
            _that.sellerLogo,
            _that.lat,
            _that.lng,
            _that.price,
            _that.currency,
            _that.quantity,
            _that.distanceKm,
            _that.batchNumber,
            _that.expiryDate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MarketplaceListing implements MarketplaceListing {
  const _MarketplaceListing(
      {@JsonKey(name: 'listing_id') required this.id,
      @JsonKey(name: 'inventory_id') required this.inventoryId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_image') this.productImage,
      @JsonKey(name: 'seller_institution_id') required this.sellerId,
      @JsonKey(name: 'seller_name') required this.sellerName,
      @JsonKey(name: 'seller_logo') this.sellerLogo,
      @JsonKey(name: 'seller_lat') required this.lat,
      @JsonKey(name: 'seller_lng') required this.lng,
      required this.price,
      required this.currency,
      @JsonKey(name: 'quantity_listed') required this.quantity,
      @JsonKey(name: 'distance_km') required this.distanceKm,
      @JsonKey(name: 'batch_number') this.batchNumber,
      @JsonKey(name: 'expiry_date') this.expiryDate});
  factory _MarketplaceListing.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceListingFromJson(json);

  @override
  @JsonKey(name: 'listing_id')
  final String id;
  @override
  @JsonKey(name: 'inventory_id')
  final String inventoryId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_image')
  final String? productImage;
  @override
  @JsonKey(name: 'seller_institution_id')
  final String sellerId;
  @override
  @JsonKey(name: 'seller_name')
  final String sellerName;
  @override
  @JsonKey(name: 'seller_logo')
  final String? sellerLogo;
  @override
  @JsonKey(name: 'seller_lat')
  final double lat;
  @override
  @JsonKey(name: 'seller_lng')
  final double lng;
  @override
  final double price;
  @override
  final String currency;
  @override
  @JsonKey(name: 'quantity_listed')
  final int quantity;
  @override
  @JsonKey(name: 'distance_km')
  final double distanceKm;
  @override
  @JsonKey(name: 'batch_number')
  final String? batchNumber;
  @override
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;

  /// Create a copy of MarketplaceListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MarketplaceListingCopyWith<_MarketplaceListing> get copyWith =>
      __$MarketplaceListingCopyWithImpl<_MarketplaceListing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MarketplaceListingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MarketplaceListing &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.inventoryId, inventoryId) ||
                other.inventoryId == inventoryId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.sellerLogo, sellerLogo) ||
                other.sellerLogo == sellerLogo) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      inventoryId,
      productName,
      productImage,
      sellerId,
      sellerName,
      sellerLogo,
      lat,
      lng,
      price,
      currency,
      quantity,
      distanceKm,
      batchNumber,
      expiryDate);

  @override
  String toString() {
    return 'MarketplaceListing(id: $id, inventoryId: $inventoryId, productName: $productName, productImage: $productImage, sellerId: $sellerId, sellerName: $sellerName, sellerLogo: $sellerLogo, lat: $lat, lng: $lng, price: $price, currency: $currency, quantity: $quantity, distanceKm: $distanceKm, batchNumber: $batchNumber, expiryDate: $expiryDate)';
  }
}

/// @nodoc
abstract mixin class _$MarketplaceListingCopyWith<$Res>
    implements $MarketplaceListingCopyWith<$Res> {
  factory _$MarketplaceListingCopyWith(
          _MarketplaceListing value, $Res Function(_MarketplaceListing) _then) =
      __$MarketplaceListingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'listing_id') String id,
      @JsonKey(name: 'inventory_id') String inventoryId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_image') String? productImage,
      @JsonKey(name: 'seller_institution_id') String sellerId,
      @JsonKey(name: 'seller_name') String sellerName,
      @JsonKey(name: 'seller_logo') String? sellerLogo,
      @JsonKey(name: 'seller_lat') double lat,
      @JsonKey(name: 'seller_lng') double lng,
      double price,
      String currency,
      @JsonKey(name: 'quantity_listed') int quantity,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'batch_number') String? batchNumber,
      @JsonKey(name: 'expiry_date') String? expiryDate});
}

/// @nodoc
class __$MarketplaceListingCopyWithImpl<$Res>
    implements _$MarketplaceListingCopyWith<$Res> {
  __$MarketplaceListingCopyWithImpl(this._self, this._then);

  final _MarketplaceListing _self;
  final $Res Function(_MarketplaceListing) _then;

  /// Create a copy of MarketplaceListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? inventoryId = null,
    Object? productName = null,
    Object? productImage = freezed,
    Object? sellerId = null,
    Object? sellerName = null,
    Object? sellerLogo = freezed,
    Object? lat = null,
    Object? lng = null,
    Object? price = null,
    Object? currency = null,
    Object? quantity = null,
    Object? distanceKm = null,
    Object? batchNumber = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_MarketplaceListing(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      inventoryId: null == inventoryId
          ? _self.inventoryId
          : inventoryId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _self.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImage: freezed == productImage
          ? _self.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerId: null == sellerId
          ? _self.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _self.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerLogo: freezed == sellerLogo
          ? _self.sellerLogo
          : sellerLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      batchNumber: freezed == batchNumber
          ? _self.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
