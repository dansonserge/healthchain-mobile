import 'package:flutter/foundation.dart';

@immutable
class SaleRecord {
  final String id;
  final String inventoryId;
  final String productId;
  final int quantity;
  final double unitPrice;
  final double totalAmount;
  final double taxAmount;
  final double discountAmount;
  final String channel;
  final String sellerId;
  final String institutionId;
  final DateTime createdAt;
  final Map<String, dynamic>? product;

  const SaleRecord({
    required this.id,
    required this.inventoryId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.totalAmount,
    required this.taxAmount,
    required this.discountAmount,
    required this.channel,
    required this.sellerId,
    required this.institutionId,
    required this.createdAt,
    this.product,
  });

  factory SaleRecord.fromJson(Map<String, dynamic> json) {
    return SaleRecord(
      id: json['id'],
      inventoryId: json['inventory_id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      unitPrice: (json['unit_price'] as num).toDouble(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      taxAmount: (json['tax_amount'] as num).toDouble(),
      discountAmount: (json['discount_amount'] as num).toDouble(),
      channel: json['channel'],
      sellerId: json['seller_id'],
      institutionId: json['institution_id'],
      createdAt: DateTime.parse(json['created_at']),
      product: json['product'],
    );
  }
}
