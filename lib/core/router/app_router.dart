import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/ui/login_screen.dart';
import '../../features/scanner/ui/scanner_screen.dart';
import '../../features/iot/ui/iot_monitor_screen.dart';
import '../../features/iot/ui/iot_detail_screen.dart';
import '../../features/iot/domain/iot_models.dart';
import '../../features/auth/domain/auth_notifier.dart';

import '../../features/home/ui/dashboard_screen.dart';
import '../../features/inventory/ui/inventory_screen.dart';
import '../../features/marketplace/ui/screens/marketplace_screen.dart';
import '../../features/marketplace/ui/screens/product_details_screen.dart';
import '../../features/marketplace/ui/procurement_screen.dart';
import '../../features/marketplace/ui/orders_screen.dart';
import '../../features/sales/ui/sales_screen.dart';
import '../../features/sales/ui/record_sale_screen.dart';

import '../ui/navigation/main_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class SupplyChainScreenResolver extends ConsumerWidget {
  const SupplyChainScreenResolver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    return authState.isSupplier ? const OrdersScreen() : const ProcurementScreen();
  }
}

// Global Router Provider
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/auth/login',
    routes: [
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/scan',
        builder: (context, state) => const ScannerScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Home / Dashboard
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
          // Branch 1: Inventory
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/inventory',
                builder: (context, state) => const InventoryScreen(),
              ),
            ],
          ),
          // Branch 2: Marketplace
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/marketplace',
                builder: (context, state) => const MarketplaceScreen(),
              ),
            ],
          ),
          // Branch 3: Procurement OR Orders
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/supply-chain',
                builder: (context, state) => const SupplyChainScreenResolver(),
              ),
            ],
          ),
        ],
      ),
      // Keep IoT outside or nested if needed. We'll leave it at root level for now so it covers the whole screen
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/iot',
        builder: (context, state) => const IotMonitorScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final device = state.extra as IOTDevice;
              return IotDetailScreen(device: device);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/marketplace/details/:id',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProductDetailsScreen(productId: id);
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/sales',
        builder: (context, state) => const SalesScreen(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/sales/record',
        builder: (context, state) => const RecordSaleScreen(),
      ),
    ],
  );
});
