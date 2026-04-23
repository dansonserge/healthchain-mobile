import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/config/app_config.dart';
import '../../../features/auth/domain/auth_notifier.dart';

class AppDrawer extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const AppDrawer({
    super.key,
    required this.navigationShell,
  });

  void _gotoTab(BuildContext context, int index) {
    Navigator.pop(context); // Close drawer
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.userDetails;
    
    final instName = user?['institutionName'] ?? 'HealthPlus';
    final instType = user?['type'] ?? 'Supplier Distributor';
    final instLogo = user?['institutionLogo']?.toString() ?? '';
    
    final userName = user?['first_name'] != null && user?['last_name'] != null 
        ? '${user!['first_name']} ${user!['last_name'][0]}' 
        : 'James J';
    final role = user?['role'] ?? 'Admin';

    final profilePic = user?['profile_pic']?.toString() ?? '';
    String? avatarUrl;
    if (profilePic.isNotEmpty) {
      if (profilePic.startsWith('http')) {
        avatarUrl = profilePic;
      } else {
        final baseUrl = AppConfig.authApiBaseUrl;
        final cleanBase = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
        final cleanPath = profilePic.startsWith('/') ? profilePic.substring(1) : profilePic;
        
        if (cleanPath.startsWith('api/auth/v1')) {
          final domainOnly = cleanBase.split('/api/').first;
          avatarUrl = '$domainOnly/$cleanPath';
        } else {
          avatarUrl = '$cleanBase/$cleanPath';
        }
      }
    }

    String? logoUrl;
    if (instLogo.isNotEmpty) {
      if (instLogo.startsWith('http')) {
        logoUrl = instLogo;
      } else {
        final baseUrl = AppConfig.authApiBaseUrl;
        final cleanBase = baseUrl.endsWith('/') ? baseUrl.substring(0, baseUrl.length - 1) : baseUrl;
        final cleanPath = instLogo.startsWith('/') ? instLogo.substring(1) : instLogo;
        
        if (cleanPath.startsWith('api/auth/v1')) {
          final domainOnly = cleanBase.split('/api/').first;
          logoUrl = '$domainOnly/$cleanPath';
        } else {
          logoUrl = '$cleanBase/$cleanPath';
        }
      }
    }

    final currentIndex = navigationShell.currentIndex;

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
                      image: logoUrl != null 
                        ? DecorationImage(
                            image: NetworkImage(logoUrl),
                            fit: BoxFit.contain,
                          ) 
                        : null,
                    ),
                    child: logoUrl == null 
                        ? const Icon(Icons.business_rounded, color: Colors.blueGrey, size: 24) 
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          instName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          instType.replaceAll('_', ' '),
                          style: const TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 20),
                ],
              ),
            ),
            const Divider(height: 1),
            
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildNavItem(
                    Icons.bar_chart_rounded, 
                    'Dashboard', 
                    isSelected: currentIndex == 0,
                    onTap: () => _gotoTab(context, 0),
                  ),
                  _buildNavItem(
                    Icons.inventory_2_outlined, 
                    'Inventory', 
                    isSelected: currentIndex == 1,
                    onTap: () => _gotoTab(context, 1),
                  ),
                  _buildNavItem(
                    Icons.sensors_rounded, 
                    'IoT Sensors', 
                    onTap: () {
                      Navigator.pop(context);
                      context.push('/iot');
                    },
                  ),
                  _buildNavItem(Icons.analytics_outlined, 'AI Analytics'),
                  
                  _buildSectionHeader('MARKETPLACE'),
                  _buildNavItem(
                    Icons.language_rounded, 
                    'Marketplace', 
                    isSelected: currentIndex == 2,
                    onTap: () => _gotoTab(context, 2),
                  ),
                  _buildNavItem(Icons.shopping_cart_outlined, 'Shopping Cart'),
                  _buildNavItem(
                    Icons.history_rounded, 
                    'Supply Chain', 
                    isSelected: currentIndex == 3,
                    onTap: () => _gotoTab(context, 3),
                  ),
                  _buildNavItem(Icons.inventory_outlined, 'Orders'),
                  _buildNavItem(Icons.storefront_outlined, 'My Listings'),
                  
                  _buildSectionHeader('CATALOG MANAGEMENT'),
                  _buildNavItem(Icons.grid_view_rounded, 'Product Catalog'),
                  _buildNavItem(Icons.layers_outlined, 'Product Categories'),
                  
                  const Divider(height: 24),
                  _buildNavItem(Icons.settings_outlined, 'Settings', hasChevron: true),
                ],
              ),
            ),
            
            // Footer user profile
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
                      child: avatarUrl == null 
                          ? const Icon(Icons.person, color: Colors.black54, size: 20)
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87),
                          ),
                          Text(
                            role,
                            style: const TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.logout_rounded, color: Colors.black54, size: 20),
                      onPressed: () {
                        ref.read(authProvider.notifier).logout();
                        context.go('/auth/login');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 24, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.black45,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, {bool isSelected = false, bool hasChevron = false, VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black87 : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.white : Colors.black54, size: 22),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        trailing: hasChevron ? const Icon(Icons.chevron_right, color: Colors.black54, size: 20) : null,
        dense: true,
        horizontalTitleGap: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onTap: onTap,
      ),
    );
  }
}
