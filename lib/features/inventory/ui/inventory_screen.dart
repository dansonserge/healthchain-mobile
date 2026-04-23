import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/inventory_repository.dart';
import 'widgets/inventory_item_tile.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inventoryItems = ref.watch(inventoryListProvider(_searchQuery));
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[50],
      body: Column(
        children: [
          // Header & Search Section
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.black : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Inventory',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    _buildNewStockButton(context),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search batch, item name...',
                      hintStyle: TextStyle(color: isDarkMode ? Colors.white38 : Colors.grey[500]),
                      prefixIcon: Icon(Icons.search_rounded, color: isDarkMode ? Colors.white54 : Colors.grey[600]),
                      suffixIcon: _searchQuery.isNotEmpty 
                        ? IconButton(
                            icon: const Icon(Icons.close_rounded, size: 20),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _searchQuery = '';
                              });
                            },
                          )
                        : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Inventory List
          Expanded(
            child: inventoryItems.when(
              data: (items) {
                if (items.isEmpty) {
                  return _buildEmptyState(isDarkMode);
                }
                return RefreshIndicator(
                  onRefresh: () => ref.refresh(inventoryListProvider(_searchQuery).future),
                  color: Colors.black,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 12, bottom: 100), // Space for bottom nav
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return InventoryItemTile(item: items[index]);
                    },
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.black),
              ),
              error: (err, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline_rounded, size: 48, color: Colors.redAccent),
                    const SizedBox(height: 16),
                    Text('Failed to load inventory', style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87)),
                    TextButton(
                      onPressed: () => ref.refresh(inventoryListProvider(_searchQuery)),
                      child: const Text('Try Again', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewStockButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Open Add Stock Modal
      },
      icon: const Icon(Icons.add_rounded, size: 20),
      label: const Text('New Stock'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Primary black button
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildEmptyState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 80,
            color: isDarkMode ? Colors.white10 : Colors.black.withValues(alpha: 0.05),
          ),
          const SizedBox(height: 20),
          Text(
            _searchQuery.isEmpty ? 'No inventory found' : 'No results for "$_searchQuery"',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white38 : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
