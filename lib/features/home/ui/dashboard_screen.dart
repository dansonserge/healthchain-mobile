import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../auth/domain/auth_notifier.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.userDetails;

    final userName = user?['firstName'] != null && user?['lastName'] != null
        ? '${user!['firstName']} ${user!['lastName']}'
        : (user?['name'] ?? 'Guest User');
        
    final userRole = user?['role'] ?? 'Administrator';
        
    final avatarKey = user?['avatar'];
    final avatarUrl = avatarKey != null && avatarKey.toString().isNotEmpty 
        ? '${AppConfig.authApiBaseUrl}/avatars/$avatarKey' 
        : null;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: Colors.transparent, // Let MainScaffold background show through
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Sidebar Toggle Button
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.white10 : Colors.black.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.menu_rounded, color: textColor, size: 28),
                    ),
                  ),
                  
                  // Profile Summary
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            userName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          Text(
                            userRole,
                            style: TextStyle(
                              fontSize: 12,
                              color: isDarkMode ? Colors.white54 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: isDarkMode ? Colors.white24 : Colors.black12,
                        backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
                        child: avatarUrl == null 
                            ? Icon(Icons.person, color: isDarkMode ? Colors.white70 : Colors.black54)
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Dashboard Content Placeholder
            Expanded(
              child: Center(
                child: Text(
                  'Dashboard Overview',
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white38 : Colors.black38,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
