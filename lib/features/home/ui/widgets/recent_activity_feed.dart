import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../inventory/domain/inventory_models.dart';

class RecentActivityFeed extends StatelessWidget {
  final List<InventoryTransaction> transactions;

  const RecentActivityFeed({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'RECENT ACTIVITIES',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.grey,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final tx = transactions[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: isDarkMode ? Colors.white12 : Colors.black.withValues(alpha: 0.05)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: tx.typeColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(tx.typeIcon, size: 20, color: tx.typeColor),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.productName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              tx.actorName,
                              style: TextStyle(fontSize: 10, color: isDarkMode ? Colors.white38 : Colors.grey[600]),
                            ),
                            const SizedBox(width: 6),
                            const Text('·', style: TextStyle(color: Colors.grey)),
                            const SizedBox(width: 6),
                            Text(
                              timeago.format(tx.createdAt),
                              style: TextStyle(fontSize: 10, color: isDarkMode ? Colors.white38 : Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${tx.quantityChange > 0 ? '+' : ''}${tx.quantityChange}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: tx.quantityChange > 0 ? Colors.green : Colors.redAccent,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        _getLabel(tx.type),
                        style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  String _getLabel(TransactionType type) {
    switch (type) {
      case TransactionType.receipt: return 'STORED';
      case TransactionType.adjustment: return 'ADJUSTED';
      case TransactionType.dispatch: return 'SHIPPED';
      case TransactionType.retour: return 'RETURNED';
      case TransactionType.pricingUpdate: return 'PRICE';
      case TransactionType.dispense: return 'DISPENSED';
      case TransactionType.shipped: return 'SHIPPED';
      default: return 'ACTIVITY';
    }
  }
}
