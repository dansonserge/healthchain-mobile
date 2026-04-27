import 'package:flutter/material.dart';

class InventoryProduct {
  final String id;
  final String name;
  final String? imageUrl;

  InventoryProduct({
    required this.id,
    required this.name,
    this.imageUrl,
  });

  factory InventoryProduct.fromJson(Map<String, dynamic> json) {
    return InventoryProduct(
      id: json['id'],
      name: json['name'] ?? 'Unknown Product',
      imageUrl: json['image_url'],
    );
  }
}

enum StockStatus { inStock, lowStock, outOfStock, overStock }

class InventoryItem {
  final String id;
  final int quantity;
  final int listedQuantity;
  final String? batchNumber;
  final DateTime? expirationDate;
  final double purchaseCost;
  final double sellingPrice;
  final int minThreshold;
  final int maxThreshold;
  final InventoryProduct product;

  InventoryItem({
    required this.id,
    required this.quantity,
    required this.listedQuantity,
    this.batchNumber,
    this.expirationDate,
    required this.purchaseCost,
    required this.sellingPrice,
    required this.minThreshold,
    required this.maxThreshold,
    required this.product,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['id'],
      quantity: json['quantity'] ?? 0,
      listedQuantity: json['listed_quantity'] ?? 0,
      batchNumber: json['batch_number'],
      expirationDate: json['expiration_date'] != null 
          ? DateTime.parse(json['expiration_date']) 
          : null,
      purchaseCost: (json['purchase_cost'] ?? 0).toDouble(),
      sellingPrice: (json['selling_price'] ?? 0).toDouble(),
      minThreshold: json['min_threshold'] ?? 10,
      maxThreshold: json['max_threshold'] ?? 0,
      product: InventoryProduct.fromJson(json['edges']['product']),
    );
  }

  StockStatus get status {
    if (quantity == 0) return StockStatus.outOfStock;
    if (quantity <= minThreshold) return StockStatus.lowStock;
    if (maxThreshold > 0 && quantity >= maxThreshold) return StockStatus.overStock;
    return StockStatus.inStock;
  }

  String get statusLabel {
    switch (status) {
      case StockStatus.outOfStock: return 'OUT OF STOCK';
      case StockStatus.lowStock: return 'LOW STOCK';
      case StockStatus.overStock: return 'OVERSTOCK';
      case StockStatus.inStock: return 'IN STOCK';
    }
  }

  Color get statusColor {
    switch (status) {
      case StockStatus.outOfStock: return Colors.redAccent;
      case StockStatus.lowStock: return Colors.orangeAccent;
      case StockStatus.overStock: return Colors.blueAccent;
      case StockStatus.inStock: return Colors.greenAccent;
    }
  }

  int get daysToExpiry {
    if (expirationDate == null) return 9999;
    return expirationDate!.difference(DateTime.now()).inDays;
  }

  bool get isExpiringSoon => daysToExpiry > 0 && daysToExpiry < 90;
  bool get isExpired => daysToExpiry <= 0;
}

enum TransactionType { receipt, adjustment, dispatch, retour, pricingUpdate, dispense, shipped }

class InventoryTransaction {
  final String id;
  final TransactionType type;
  final int quantityChange;
  final int newQuantity;
  final String actorName;
  final String? actorAvatar;
  final String actorInstitution;
  final String? reference;
  final DateTime createdAt;
  final String productName;

  InventoryTransaction({
    required this.id,
    required this.type,
    required this.quantityChange,
    required this.newQuantity,
    required this.actorName,
    this.actorAvatar,
    required this.actorInstitution,
    this.reference,
    required this.createdAt,
    required this.productName,
  });

  factory InventoryTransaction.fromJson(Map<String, dynamic> json) {
    TransactionType type;
    switch (json['transaction_type']) {
      case 'RECEIPT': type = TransactionType.receipt; break;
      case 'ADJUSTMENT': type = TransactionType.adjustment; break;
      case 'DISPATCH': type = TransactionType.dispatch; break;
      case 'RETURN': type = TransactionType.retour; break;
      case 'PRICING_UPDATE': type = TransactionType.pricingUpdate; break;
      case 'DISPENSED': type = TransactionType.dispense; break;
      case 'SHIPPED': type = TransactionType.shipped; break;
      default: type = TransactionType.adjustment;
    }

    // Handle nested products if present, or fallback
    String prodName = 'Inventory Activity';
    if (json['edges'] != null && json['edges']['inventory'] != null) {
      final inv = json['edges']['inventory'];
      if (inv['edges'] != null && inv['edges']['product'] != null) {
        prodName = inv['edges']['product']['name'] ?? prodName;
      }
    }

    return InventoryTransaction(
      id: json['id'],
      type: type,
      quantityChange: json['quantity_change'] ?? 0,
      newQuantity: json['new_quantity'] ?? 0,
      actorName: json['actor_name'] ?? 'System',
      actorAvatar: json['actor_avatar'],
      actorInstitution: json['actor_institution'] ?? 'HealthChain',
      reference: json['reference'],
      createdAt: DateTime.parse(json['created_at']),
      productName: prodName,
    );
  }

  String get typeLabel {
    switch (type) {
      case TransactionType.receipt: return 'RECEIPT';
      case TransactionType.adjustment: return 'ADJUSTMENT';
      case TransactionType.dispatch: return 'DISPATCH';
      case TransactionType.retour: return 'RETURN';
      case TransactionType.pricingUpdate: return 'PRICING';
      case TransactionType.dispense: return 'DISPENSE';
      case TransactionType.shipped: return 'SHIPPED';
    }
  }

  Color get typeColor {
    switch (type) {
      case TransactionType.receipt: return Colors.green;
      case TransactionType.adjustment: return Colors.amber;
      case TransactionType.dispatch: return Colors.pink;
      case TransactionType.retour: return Colors.purple;
      case TransactionType.pricingUpdate: return Colors.pink;
      case TransactionType.dispense: return Colors.blue;
      case TransactionType.shipped: return Colors.indigo;
    }
  }

  IconData get typeIcon {
    switch (type) {
      case TransactionType.receipt: return Icons.trending_up;
      case TransactionType.adjustment: return Icons.flash_on;
      case TransactionType.dispatch: return Icons.trending_down;
      case TransactionType.retour: return Icons.keyboard_return;
      case TransactionType.pricingUpdate: return Icons.attach_money;
      case TransactionType.dispense: return Icons.medical_services;
      case TransactionType.shipped: return Icons.local_shipping;
    }
  }
}
