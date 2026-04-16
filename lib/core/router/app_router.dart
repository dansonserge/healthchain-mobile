import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Dummy screens to unblock routing
import '../../features/auth/ui/login_screen.dart';
import '../../features/scanner/ui/scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: ElevatedButton(
        child: const Text('Open Scanner'),
        onPressed: () => context.push('/scan'),
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
    ],
  );
});
