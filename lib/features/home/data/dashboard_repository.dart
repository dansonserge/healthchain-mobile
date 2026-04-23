import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../../inventory/domain/inventory_models.dart';
import '../domain/dashboard_models.dart';

class DashboardRepository {
  final Dio marketplaceDio;
  final Dio supplyChainDio;

  DashboardRepository({
    required this.marketplaceDio,
    required this.supplyChainDio,
  });

  Future<DashboardMetrics> fetchMetrics() async {
    final response = await marketplaceDio.get('/v1/analytics/seller');
    return DashboardMetrics.fromJson(response.data);
  }

  Future<List<InventoryTransaction>> fetchRecentActivity() async {
    final response = await supplyChainDio.get('/inventory/transactions', queryParameters: {'limit': 10});
    final List<dynamic> data = response.data['data'] ?? [];
    return data.map((json) => InventoryTransaction.fromJson(json)).toList();
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(
    marketplaceDio: ref.watch(marketplaceDioProvider),
    supplyChainDio: ref.watch(supplyChainDioProvider),
  );
});

final dashboardMetricsProvider = FutureProvider<DashboardMetrics>((ref) async {
  return ref.watch(dashboardRepositoryProvider).fetchMetrics();
});

final dashboardActivityProvider = FutureProvider<List<InventoryTransaction>>((ref) async {
  return ref.watch(dashboardRepositoryProvider).fetchRecentActivity();
});
