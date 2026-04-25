import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/marketplace_models.dart';

class CartNotifier extends Notifier<List<ProcurementCartItem>> {
  @override
  List<ProcurementCartItem> build() {
    return [];
  }

  void addOrUpdateItem(MarketplaceListing listing, int quantity) {
    final index = state.indexWhere((item) => item.listing.id == listing.id);
    if (index >= 0) {
      final newState = List<ProcurementCartItem>.from(state);
      newState[index] = ProcurementCartItem(listing: listing, quantity: quantity);
      state = newState;
    } else {
      state = [...state, ProcurementCartItem(listing: listing, quantity: quantity)];
    }
  }

  void removeItem(String listingId) {
    state = state.where((item) => item.listing.id != listingId).toList();
  }

  void clearCart() {
    state = [];
  }

  double get totalAmount {
    return state.fold(0.0, (sum, item) => sum + (item.listing.price * item.quantity));
  }

  int get itemCount => state.length;
}

final cartProvider = NotifierProvider<CartNotifier, List<ProcurementCartItem>>(CartNotifier.new);
