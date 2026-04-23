class DashboardMetrics {
  final double totalRevenue;
  final int activeListings;
  final int pendingFulfillments;
  final int pendingSettlements;
  final List<RevenueTrendPoint> revenueTrend;

  DashboardMetrics({
    required this.totalRevenue,
    required this.activeListings,
    required this.pendingFulfillments,
    required this.pendingSettlements,
    required this.revenueTrend,
  });

  factory DashboardMetrics.fromJson(Map<String, dynamic> json) {
    var trend = <RevenueTrendPoint>[];
    if (json['revenue_trend'] != null) {
      trend = (json['revenue_trend'] as List)
          .map((i) => RevenueTrendPoint.fromJson(i))
          .toList();
    }

    return DashboardMetrics(
      totalRevenue: (json['total_revenue'] ?? 0).toDouble(),
      activeListings: json['active_listings'] ?? 0,
      pendingFulfillments: json['pending_fulfillments'] ?? 0,
      pendingSettlements: json['pending_settlements'] ?? 0,
      revenueTrend: trend,
    );
  }
}

class RevenueTrendPoint {
  final String month;
  final double revenue;
  final int volume;

  RevenueTrendPoint({
    required this.month,
    required this.revenue,
    required this.volume,
  });

  factory RevenueTrendPoint.fromJson(Map<String, dynamic> json) {
    return RevenueTrendPoint(
      month: json['month'] ?? '',
      revenue: (json['revenue'] ?? 0).toDouble(),
      volume: json['volume'] ?? 0,
    );
  }
}
