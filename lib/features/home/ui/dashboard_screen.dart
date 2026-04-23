import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../auth/domain/auth_notifier.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.transparent, // Let MainScaffold background show through
      body: Center(
        child: Text(
          'Dashboard Overview',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white38 : Colors.black38,
          ),
        ),
      ),
    );
  }
}
