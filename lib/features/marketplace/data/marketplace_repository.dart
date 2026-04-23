import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../../../core/config/app_config.dart';
import '../domain/marketplace_models.dart';

import 'package:equatable/equatable.dart';

class ProductSearchFilters extends Equatable {
  final String? search;
  final String? categoryId;

  const ProductSearchFilters({this.search, this.categoryId});

  @override
  List<Object?> get props => [search, categoryId];
}

class MarketplaceRepository {
  final Dio dio;

  MarketplaceRepository({required this.dio});

  String? _formatImageUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.startsWith('http')) return url;
    
    // The user example shows assets are served from:
    // [SUPPLY_CHAIN_URL]/catalog/assets/[relative_url]
    final base = AppConfig.supplyChainApiBaseUrl;
    final cleanBase = base.endsWith('/') ? base.substring(0, base.length - 1) : base;
    final cleanUrl = url.startsWith('/') ? url : '/$url';
    
    return '$cleanBase/catalog/assets$cleanUrl';
  }

  Future<List<MarketplaceProduct>> fetchProducts({
    double lat = -1.9441, // Default Kigali
    double lng = 30.0619,
    String? search,
    String? categoryId,
  }) async {
    final response = await dio.get('/marketplace/v1/products', queryParameters: {
      'lat': lat,
      'lng': lng,
      if (search != null) 'search': search,
      if (categoryId != null) 'category_id': categoryId,
    });
    
    final List<dynamic> data = response.data['data'] ?? [];
    return data.map((json) {
      final product = MarketplaceProduct.fromJson(json);
      return product.copyWith(
        imageUrl: _formatImageUrl(product.imageUrl),
      );
    }).toList();
  }

  Future<List<MarketplaceListing>> fetchProductSuppliers({
    required String productId,
    double lat = -1.9441,
    double lng = 30.0619,
  }) async {
    final response = await dio.get('/marketplace/v1/products/$productId/suppliers', queryParameters: {
      'lat': lat,
      'lng': lng,
    });
    
    final List<dynamic> data = response.data['data'] ?? [];
    return data.map((json) {
      final listing = MarketplaceListing.fromJson(json);
      return listing.copyWith(
        productImage: _formatImageUrl(listing.productImage),
        sellerLogo: _formatImageUrl(listing.sellerLogo),
      );
    }).toList();
  }
}

final marketplaceRepositoryProvider = Provider<MarketplaceRepository>((ref) {
  return MarketplaceRepository(dio: ref.watch(marketplaceDioProvider));
});

final marketplaceProductsProvider = FutureProvider.family<List<MarketplaceProduct>, ProductSearchFilters>((ref, filters) async {
  return ref.watch(marketplaceRepositoryProvider).fetchProducts(
    search: filters.search,
    categoryId: filters.categoryId,
  );
});

final productSuppliersProvider = FutureProvider.family<List<MarketplaceListing>, String>((ref, productId) async {
  return ref.watch(marketplaceRepositoryProvider).fetchProductSuppliers(productId: productId);
});
