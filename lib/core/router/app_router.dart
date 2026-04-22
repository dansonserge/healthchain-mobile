import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Dummy screens to unblock routing
import '../../features/auth/ui/login_screen.dart';
import '../../features/scanner/ui/scanner_screen.dart';
import '../../features/iot/ui/iot_monitor_screen.dart';
import '../../features/iot/ui/iot_detail_screen.dart';
import '../../features/iot/domain/iot_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('IOT SURVEILLANCE'),
            onPressed: () => context.push('/iot'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Open Scanner'),
            onPressed: () => context.push('/scan'),
          ),
        ],
      ),
    ),
  );
}

// Global Router Provider
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/auth/login',
    routes: [
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/scan',
        builder: (context, state) => const ScannerScreen(),
      ),
      GoRoute(
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
    ],
  );
});
