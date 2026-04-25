import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../auth/domain/auth_notifier.dart';
import '../data/dashboard_repository.dart';
import 'widgets/activity_heatmap.dart';
import 'widgets/kpi_card.dart';
import 'widgets/recent_activity_feed.dart';


class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.userDetails;
    final metricsAsync = ref.watch(dashboardMetricsProvider);
    final activityAsync = ref.watch(dashboardActivityProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final currencyFormat = NumberFormat.currency(symbol: 'RWF ', decimalDigits: 0);

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[50],
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardMetricsProvider);
          ref.invalidate(dashboardActivityProvider);
        },
        color: Colors.black,
        child: CustomScrollView(
          slivers: [
            // Welcome Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getGreeting(),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${user?['first_name'] ?? 'User'} ${user?['last_name'] ?? ''}',
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                    ),
                    Text(
                      user?['institutionName'] ?? 'HealthChain Facility',
                      style: TextStyle(fontSize: 12, color: isDarkMode ? Colors.white38 : Colors.grey[600], fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),

            // KPI Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: metricsAsync.when(
                data: (metrics) => SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2.2,
                  ),
                  delegate: SliverChildListDelegate([
                    KPICard(
                      label: 'Total Revenue',
                      value: currencyFormat.format(metrics.totalRevenue),
                      icon: Icons.account_balance_wallet_rounded,
                      iconColor: Colors.teal,
                    ),
                    KPICard(
                      label: 'Pending Fulfillments',
                      value: '${metrics.pendingFulfillments}',
                      icon: Icons.inventory_2_rounded,
                      iconColor: Colors.orange,
                      isUrgent: metrics.pendingFulfillments > 0,
                    ),
                    KPICard(
                      label: 'Active Listings',
                      value: '${metrics.activeListings}',
                      icon: Icons.storefront_rounded,
                      iconColor: Colors.blue,
                    ),
                    KPICard(
                      label: 'Pending Settlements',
                      value: currencyFormat.format(metrics.pendingSettlements),
                      icon: Icons.payments_rounded,
                      iconColor: Colors.pink,
                    ),
                  ]),
                ),
                loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(color: Colors.black))),
                error: (e, s) => const SliverToBoxAdapter(child: SizedBox()),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),



            const SliverToBoxAdapter(child: SizedBox(height: 32)),

            // Heatmap
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: activityAsync.when(
                  data: (txs) => ActivityHeatmap(transactions: txs),
                  loading: () => Container(height: 180, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(16))),
                  error: (e, s) => const SizedBox(),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 32)),

            // Recent Activity Feed
            SliverToBoxAdapter(
              child: activityAsync.when(
                data: (txs) => RecentActivityFeed(transactions: txs.take(5).toList()),
                loading: () => const Center(child: CircularProgressIndicator(color: Colors.black)),
                error: (e, s) => Center(child: Text('Failed to load recent activity', style: TextStyle(color: isDarkMode ? Colors.white38 : Colors.grey))),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 100)), // Bottom nav padding
          ],
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'GOOD MORNING';
    if (hour < 17) return 'GOOD AFTERNOON';
    return 'GOOD EVENING';
  }
}
