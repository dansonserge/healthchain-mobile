import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/sync/sync_worker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  // Register Maps API Key from .env with Native SDKs
  final mapsKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
  if (mapsKey != null) {
    try {
      const MethodChannel('com.healthchain/config')
          .invokeMethod('initMaps', mapsKey);
    } catch (e) {
      debugPrint('Failed to initialize Maps SDK: $e');
    }
  }
  
  runApp(const ProviderScope(child: HealthChainApp()));
}

class HealthChainApp extends ConsumerWidget {
  const HealthChainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize the offline sync worker engine
    ref.watch(syncWorkerProvider);

    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'HealthChain Optimizer',
      theme: lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
