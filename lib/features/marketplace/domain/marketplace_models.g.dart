// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketplaceProduct _$MarketplaceProductFromJson(Map<String, dynamic> json) =>
    _MarketplaceProduct(
      id: json['product_id'] as String,
      name: json['product_name'] as String,
      imageUrl: json['product_image_url'] as String?,
      price: (json['cheapest_price'] as num).toDouble(),
      currency: json['currency'] as String,
      sellerName: json['seller_name'] as String,
      sellerId: json['seller_id'] as String,
      distanceKm: (json['distance_km'] as num).toDouble(),
      batchNumber: json['batch_number'] as String?,
      expiryDate: json['expiry_date'] as String?,
      categories: (json['category_names'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MarketplaceProductToJson(_MarketplaceProduct instance) =>
    <String, dynamic>{
      'product_id': instance.id,
      'product_name': instance.name,
      'product_image_url': instance.imageUrl,
      'cheapest_price': instance.price,
      'currency': instance.currency,
      'seller_name': instance.sellerName,
      'seller_id': instance.sellerId,
      'distance_km': instance.distanceKm,
      'batch_number': instance.batchNumber,
      'expiry_date': instance.expiryDate,
      'category_names': instance.categories,
    };

_MarketplaceListing _$MarketplaceListingFromJson(Map<String, dynamic> json) =>
    _MarketplaceListing(
      id: json['listing_id'] as String,
      inventoryId: json['inventory_id'] as String,
      productName: json['product_name'] as String,
      productImage: json['product_image'] as String?,
      sellerId: json['seller_institution_id'] as String,
      sellerName: json['seller_name'] as String,
      sellerLogo: json['seller_logo'] as String?,
      lat: (json['seller_lat'] as num).toDouble(),
      lng: (json['seller_lng'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      quantity: (json['quantity_listed'] as num).toInt(),
      distanceKm: (json['distance_km'] as num).toDouble(),
      batchNumber: json['batch_number'] as String?,
      expiryDate: json['expiry_date'] as String?,
    );

Map<String, dynamic> _$MarketplaceListingToJson(_MarketplaceListing instance) =>
    <String, dynamic>{
      'listing_id': instance.id,
      'inventory_id': instance.inventoryId,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'seller_institution_id': instance.sellerId,
      'seller_name': instance.sellerName,
      'seller_logo': instance.sellerLogo,
      'seller_lat': instance.lat,
      'seller_lng': instance.lng,
      'price': instance.price,
      'currency': instance.currency,
      'quantity_listed': instance.quantity,
      'distance_km': instance.distanceKm,
      'batch_number': instance.batchNumber,
      'expiry_date': instance.expiryDate,
    };
