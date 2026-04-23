import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../domain/inventory_models.dart';

class InventoryRepository {
  final Dio dio;

  InventoryRepository(this.dio);

  Future<List<InventoryItem>> fetchInventory({String? search}) async {
    try {
      final response = await dio.get(
        '/inventory',
        queryParameters: {
          'pageSize': 100,
          if (search != null && search.isNotEmpty) 'search': search,
        },
      );
      
      final List<dynamic> data = response.data['data'] ?? [];
      return data.map((json) => InventoryItem.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addStock({
    required String productId,
    required int quantity,
    String? batchNumber,
    DateTime? expirationDate,
    double? purchaseCost,
    double? sellingPrice,
  }) async {
    await dio.post('/inventory', data: {
      'product_id': productId,
      'quantity': quantity,
      if (batchNumber != null) 'batch_number': batchNumber,
      if (expirationDate != null) 'expiration_date': expirationDate.toIso8601String(),
      if (purchaseCost != null) 'purchase_cost': purchaseCost,
      if (sellingPrice != null) 'selling_price': sellingPrice,
    });
  }
}

final inventoryRepositoryProvider = Provider<InventoryRepository>((ref) {
  return InventoryRepository(ref.watch(supplyChainDioProvider));
});

final inventoryListProvider = FutureProvider.family<List<InventoryItem>, String?>((ref, search) async {
  return ref.watch(inventoryRepositoryProvider).fetchInventory(search: search);
});
