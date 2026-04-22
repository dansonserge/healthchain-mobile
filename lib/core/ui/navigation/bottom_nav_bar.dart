import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/auth/domain/auth_notifier.dart';

class BottomNavBar extends ConsumerWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final userDetails = authState.userDetails;
    
    // Determine institution type for the 5th label
    // Default to 'Procurement', switch to 'Orders' if Supplier
    bool isSupplier = false;
    if (userDetails != null && userDetails['institution'] != null) {
      final type = userDetails['institution']['type']?.toString().toLowerCase() ?? '';
      if (type.contains('supplier')) {
        isSupplier = true;
      }
    }

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF1C1C1E) : Colors.white;
    final shadowColor = isDarkMode ? Colors.black.withValues(alpha: 0.3) : Colors.black.withValues(alpha: 0.1);
    
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 0), // Removed excessive hardcoded bottom margin
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomAppBar(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 70,
            color: Colors.transparent,
            elevation: 0,
            notchMargin: 10, // Margin around the FAB
            shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                context: context,
                icon: Icons.home_rounded,
                label: 'Home',
                index: 0,
              ),
              _buildNavItem(
                context: context,
                icon: Icons.inventory_2_rounded,
                label: 'Inventory',
                index: 1,
              ),
              // Dummy space for centered FAB Scanner
              const SizedBox(width: 48),
              _buildNavItem(
                context: context,
                icon: Icons.storefront_rounded,
                label: 'Marketplace',
                index: 2,
              ),
              _buildNavItem(
                context: context,
                icon: isSupplier ? Icons.local_shipping_rounded : Icons.shopping_cart_checkout_rounded,
                label: isSupplier ? 'Orders' : 'Procure',
                index: 3,
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildNavItem({required BuildContext context, required IconData icon, required String label, required int index}) {
    final isSelected = currentIndex == index;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    final activeColor = isDarkMode ? Colors.white : Colors.black;
    final inactiveColor = isDarkMode ? Colors.white54 : Colors.black54;
    final color = isSelected ? activeColor : inactiveColor;
    
    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
