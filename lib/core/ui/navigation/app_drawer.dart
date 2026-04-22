import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../features/auth/domain/auth_notifier.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.userDetails;
    
    final institution = user?['institution'];
    final instName = institution?['name'] ?? 'HealthPlus';
    final instType = institution?['type'] ?? 'Supplier Distributor';
    final userName = user?['firstName'] != null && user?['lastName'] != null 
        ? '${user!['firstName']} ${user!['lastName'][0]}' 
        : 'James J';
    final role = user?['role'] ?? 'Admin';

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
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      // Ideally network image here if logo exists
                    ),
                    child: const Icon(Icons.business, color: Colors.blueGrey),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          instName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                        ),
                        Text(
                          instType,
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
                ],
              ),
            ),
            const Divider(height: 1),
            
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildNavItem(Icons.bar_chart_rounded, 'Dashboard', isSelected: true),
                  _buildNavItem(Icons.inventory_2_outlined, 'Inventory'),
                  _buildNavItem(Icons.sensors_rounded, 'IoT Sensors', onTap: () => context.push('/iot')),
                  _buildNavItem(Icons.analytics_outlined, 'AI Analytics'),
                  
                  _buildSectionHeader('MARKETPLACE'),
                  _buildNavItem(Icons.language_rounded, 'Marketplace'),
                  _buildNavItem(Icons.shopping_cart_outlined, 'Shopping Cart'),
                  _buildNavItem(Icons.history_rounded, 'Procurement'),
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
                      child: const Icon(Icons.person, color: Colors.black54, size: 20),
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
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
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
