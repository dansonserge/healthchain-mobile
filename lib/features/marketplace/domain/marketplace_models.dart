import 'package:freezed_annotation/freezed_annotation.dart';

part 'marketplace_models.freezed.dart';
part 'marketplace_models.g.dart';

@freezed
abstract class MarketplaceProduct with _$MarketplaceProduct {
  const factory MarketplaceProduct({
    @JsonKey(name: 'product_id') required String id,
    @JsonKey(name: 'product_name') required String name,
    @JsonKey(name: 'product_image_url') String? imageUrl,
    @JsonKey(name: 'cheapest_price') required double price,
    required String currency,
    @JsonKey(name: 'seller_name') required String sellerName,
    @JsonKey(name: 'seller_id') required String sellerId,
    @JsonKey(name: 'distance_km') required double distanceKm,
    @JsonKey(name: 'batch_number') String? batchNumber,
    @JsonKey(name: 'expiry_date') String? expiryDate,
    @JsonKey(name: 'category_names') @Default([]) List<String> categories,
  }) = _MarketplaceProduct;

  factory MarketplaceProduct.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceProductFromJson(json);
}

@freezed
abstract class MarketplaceListing with _$MarketplaceListing {
  const factory MarketplaceListing({
    @JsonKey(name: 'listing_id') required String id,
    @JsonKey(name: 'inventory_id') required String inventoryId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_image') String? productImage,
    @JsonKey(name: 'seller_institution_id') required String sellerId,
    @JsonKey(name: 'seller_name') required String sellerName,
    @JsonKey(name: 'seller_logo') String? sellerLogo,
    @JsonKey(name: 'seller_lat') required double lat,
    @JsonKey(name: 'seller_lng') required double lng,
    required double price,
    required String currency,
    @JsonKey(name: 'quantity_listed') required int quantity,
    @JsonKey(name: 'distance_km') required double distanceKm,
    @JsonKey(name: 'batch_number') String? batchNumber,
    @JsonKey(name: 'expiry_date') String? expiryDate,
  }) = _MarketplaceListing;

  factory MarketplaceListing.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceListingFromJson(json);
}

@freezed
abstract class ProcurementCartItem with _$ProcurementCartItem {
  const factory ProcurementCartItem({
    required MarketplaceListing listing,
    required int quantity,
  }) = _ProcurementCartItem;
}
