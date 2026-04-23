import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../inventory/domain/inventory_models.dart';

class ActivityHeatmap extends StatelessWidget {
  final List<InventoryTransaction> transactions;
  final bool loading;

  const ActivityHeatmap({
    super.key,
    required this.transactions,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // Group transactions by date
    final Map<String, int> dailyActivity = {};
    for (var tx in transactions) {
      final dateKey = DateFormat('yyyy-MM-dd').format(tx.createdAt);
      dailyActivity[dateKey] = (dailyActivity[dateKey] ?? 0) + 1;
    }

    // Generate last 6 months of dates
    final now = DateTime.now();
    final startDate = now.subtract(const Duration(days: 180));
    
    // Align to the previous Sunday to start the grid correctly
    final firstBatchDate = startDate.subtract(Duration(days: startDate.weekday % 7));
    
    final List<List<DateTime>> weeks = [];
    DateTime current = firstBatchDate;
    
    while (current.isBefore(now.add(const Duration(days: 1)))) {
      List<DateTime> week = [];
      for (int i = 0; i < 7; i++) {
        week.add(current);
        current = current.add(const Duration(days: 1));
      }
      weeks.add(week);
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDarkMode ? Colors.white12 : Colors.black.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TRANSACTION ACTIVITY',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Last 6 Months',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Less', style: TextStyle(fontSize: 8, color: Colors.grey)),
                  const SizedBox(width: 4),
                  _buildIntensityDot(0, isDarkMode),
                  _buildIntensityDot(1, isDarkMode),
                  _buildIntensityDot(3, isDarkMode),
                  _buildIntensityDot(5, isDarkMode),
                  const SizedBox(width: 4),
                  const Text('More', style: TextStyle(fontSize: 8, color: Colors.grey)),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true, // Start from today on the right
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Day Labels
                const Column(
                  children: [
                    SizedBox(height: 10),
                    _DayLabel('M'),
                    SizedBox(height: 10),
                    _DayLabel('W'),
                    SizedBox(height: 10),
                    _DayLabel('F'),
                  ],
                ),
                const SizedBox(width: 8),
                // The Heatmap Grid
                ...weeks.map((week) => Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: Column(
                    children: week.map((date) {
                      final key = DateFormat('yyyy-MM-dd').format(date);
                      final count = dailyActivity[key] ?? 0;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: _HeatmapSquare(count: count, isToday: DateFormat('yyyy-MM-dd').format(now) == key),
                      );
                    }).toList(),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntensityDot(int count, bool isDarkMode) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: _getIntensityColor(count, isDarkMode),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  static Color _getIntensityColor(int count, bool isDarkMode) {
    if (count == 0) return isDarkMode ? Colors.white10 : Colors.grey[100]!;
    if (count == 1) return Colors.green.withValues(alpha: 0.2);
    if (count <= 3) return Colors.green.withValues(alpha: 0.5);
    if (count <= 5) return Colors.green.withValues(alpha: 0.8);
    return Colors.green;
  }
}

class _HeatmapSquare extends StatelessWidget {
  final int count;
  final bool isToday;

  const _HeatmapSquare({required this.count, this.isToday = false});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: ActivityHeatmap._getIntensityColor(count, isDarkMode),
        borderRadius: BorderRadius.circular(2),
        border: isToday ? Border.all(color: Colors.pinkAccent, width: 0.5) : null,
      ),
    );
  }
}

class _DayLabel extends StatelessWidget {
  final String label;
  const _DayLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(fontSize: 7, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
