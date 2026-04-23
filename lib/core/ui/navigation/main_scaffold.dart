import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/app_config.dart';
import '../../../features/auth/domain/auth_notifier.dart';
import 'app_drawer.dart';
import 'bottom_nav_bar.dart';

class MainScaffold extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({
    super.key,
    required this.navigationShell,
  });

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  void _showScannerModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(24),
          child: Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white24, width: 2),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.qr_code_scanner, color: Colors.white54, size: 80),
                const Positioned(
                  bottom: 24,
                  child: Text('Camera Active', style: TextStyle(color: Colors.white)),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.userDetails;

    final userName = user?['first_name'] != null && user?['last_name'] != null
        ? '${user!['first_name']} ${user!['last_name']}'
        : (user?['name'] ?? 'Guest User');
        
    final userRole = user?['role'] ?? 'Administrator';
        
    final profilePic = user?['profile_pic'];
    final avatarUrl = profilePic != null && profilePic.toString().isNotEmpty 
        ? '${AppConfig.authApiBaseUrl}/$profilePic' 
        : null;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[50], // Theme aware background
      drawer: AppDrawer(navigationShell: navigationShell),
      body: SafeArea(
        bottom: false, // Bottom is handled by bottom nav
        child: Column(
          children: [
            // Persistent Global Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Sidebar Toggle Button
                  Builder(
                    builder: (context) => InkWell(
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
            
            // Tab Content
            Expanded(child: navigationShell),
          ],
        ),
      ),
      extendBody: true, // Needed for floating/glassmorphic bottom nav
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showScannerModal(context),
        backgroundColor: isDarkMode ? Colors.white : Colors.black, // White in dark mode, black in light
        foregroundColor: isDarkMode ? Colors.black : Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_scanner, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
