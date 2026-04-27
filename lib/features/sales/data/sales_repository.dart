import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../domain/sales_models.dart';
import '../../inventory/domain/inventory_models.dart';

class SalesRepository {
  final Dio dio;

  SalesRepository(this.dio);

  Future<List<SaleRecord>> fetchSales({int page = 1, int pageSize = 10}) async {
    try {
      final response = await dio.get(
        '/inventory/sales',
        queryParameters: {
          'page': page,
          'page_size': pageSize,
        },
      );
      
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => SaleRecord.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<InventoryItem> getFEFOSuggestion(String productId) async {
    try {
      final response = await dio.get(
        '/inventory/fefo-suggestion',
        queryParameters: {'product_id': productId},
      );
      return InventoryItem.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> recordSale({
    required String inventoryId,
    required int quantity,
    required double unitPrice,
    required double totalAmount,
    double taxAmount = 0,
    double discountAmount = 0,
  }) async {
    await dio.post('/inventory/sales', data: {
      'inventory_id': inventoryId,
      'quantity': quantity,
      'unit_price': unitPrice,
      'total_amount': totalAmount,
      'tax_amount': taxAmount,
      'discount_amount': discountAmount,
    });
  }
}

final salesRepositoryProvider = Provider<SalesRepository>((ref) {
  return SalesRepository(ref.watch(supplyChainDioProvider));
});

final salesListProvider = FutureProvider<List<SaleRecord>>((ref) async {
  return ref.watch(salesRepositoryProvider).fetchSales();
});
