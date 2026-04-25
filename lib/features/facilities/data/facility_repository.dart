import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../../../core/config/app_config.dart';
import '../domain/facility_models.dart';

class FacilityRepository {
  final Dio dio;

  FacilityRepository({required this.dio});

  String? _formatImageUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.startsWith('http')) return url;
    
    // Check if the URL points to an institution logo from the auth service
    if (url.contains('/api/auth/v1')) {
      final base = AppConfig.authApiBaseUrl;
      final cleanBase = base.endsWith('/') ? base.substring(0, base.length - 1) : base;
      // Extract the path after /api/auth/v1
      final parts = url.split('/api/auth/v1');
      final pathAfterVersion = parts.length > 1 ? parts[1] : '';
      return '$cleanBase$pathAfterVersion';
    }
    
    final base = AppConfig.supplyChainApiBaseUrl;
    final cleanBase = base.endsWith('/') ? base.substring(0, base.length - 1) : base;
    final cleanUrl = url.startsWith('/') ? url : '/$url';
    
    return '$cleanBase/catalog/assets$cleanUrl';
  }

  Future<List<Facility>> fetchNearbyFacilities({
    double lat = -1.9441,
    double lng = 30.0619,
    String? type = 'pharmacy',
  }) async {
    final response = await dio.get('/supply-chain/v1/facilities/nearby', queryParameters: {
      'lat': lat,
      'lng': lng,
      'type': type,
    });
    
    final List<dynamic> data = response.data['data'] ?? [];
    return data.map((json) {
      final facility = Facility.fromJson(json);
      return facility.copyWith(
        imageUrl: _formatImageUrl(facility.imageUrl),
      );
    }).toList();
  }
}

final facilityRepositoryProvider = Provider<FacilityRepository>((ref) {
  return FacilityRepository(dio: ref.watch(supplyChainDioProvider));
});

final nearbyPharmaciesProvider = FutureProvider.family<List<Facility>, (double lat, double lng)>((ref, coords) async {
  return ref.watch(facilityRepositoryProvider).fetchNearbyFacilities(
    lat: coords.$1,
    lng: coords.$2,
    type: 'pharmacy',
  );
});
