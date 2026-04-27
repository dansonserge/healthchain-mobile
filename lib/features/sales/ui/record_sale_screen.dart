import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../inventory/data/inventory_repository.dart';
import '../../inventory/domain/inventory_models.dart';
import '../data/sales_repository.dart';

class RecordSaleScreen extends ConsumerStatefulWidget {
  const RecordSaleScreen({super.key});

  @override
  ConsumerState<RecordSaleScreen> createState() => _RecordSaleScreenState();
}

class _RecordSaleScreenState extends ConsumerState<RecordSaleScreen> {
  final _searchController = TextEditingController();
  final _qtyController = TextEditingController(text: '1');
  final _priceController = TextEditingController();
  
  InventoryItem? _selectedInventory;
  InventoryItem? _fefoBatch;
  bool _isLoading = false;
  bool _isSearching = false;
  List<InventoryItem> _searchResults = [];

  Future<void> _search(String query) async {
    if (query.isEmpty) {
      setState(() => _searchResults = []);
      return;
    }
    setState(() => _isSearching = true);
    try {
      final results = await ref.read(inventoryRepositoryProvider).fetchInventory(search: query);
      setState(() => _searchResults = results);
    } catch (e) {
      debugPrint('Search failed: $e');
    } finally {
      setState(() => _isSearching = false);
    }
  }

  Future<void> _onSelectProduct(InventoryItem item) async {
    setState(() {
      _selectedInventory = item;
      _searchResults = [];
      _searchController.text = item.productName;
      _isLoading = true;
    });

    try {
      final fefo = await ref.read(salesRepositoryProvider).getFEFOSuggestion(item.productId);
      setState(() {
        _fefoBatch = fefo;
        _priceController.text = fefo.sellingPrice.toString();
      });
    } catch (e) {
      debugPrint('FEFO lookup failed: $e');
      setState(() => _priceController.text = item.sellingPrice.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _submitSale() async {
    if (_selectedInventory == null || _fefoBatch == null) return;

    final qty = int.tryParse(_qtyController.text) ?? 0;
    final price = double.tryParse(_priceController.text) ?? 0;

    if (qty <= 0 || qty > _fefoBatch!.quantity) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid quantity or insufficient stock')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await ref.read(salesRepositoryProvider).recordSale(
        inventoryId: _fefoBatch!.id,
        quantity: qty,
        unitPrice: price,
        totalAmount: qty * price,
      );
      if (mounted) {
        ref.invalidate(salesListProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sale recorded successfully')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final total = (double.tryParse(_priceController.text) ?? 0) * (int.tryParse(_qtyController.text) ?? 0);

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('New Physical Sale', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            const Text('PRODUCT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.black, letterSpacing: 1.5, color: Colors.black45)),
            const SizedBox(height: 8),
            TextField(
              controller: _searchController,
              onChanged: _search,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: 'Search or scan product...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.qr_code_scanner_rounded),
                  onPressed: () {
                    // Integration with Scanner logic
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),

            if (_searchResults.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _searchResults.length,
                  itemBuilder: (context, i) => ListTile(
                    title: Text(_searchResults[i].productName),
                    subtitle: Text('Stock: ${_searchResults[i].quantity}'),
                    onTap: () => _onSelectProduct(_searchResults[i]),
                  ),
                ),
              ),

            const SizedBox(height: 24),

            // FEFO Batch Alert
            if (_fefoBatch != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.green.withValues(alpha: 0.1))),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_rounded, color: Colors.green),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Using Batch #${_fefoBatch!.batchNumber} (Expires: ${DateFormat("dd/MM/yyyy").format(_fefoBatch!.expirationDate)})',
                        style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 24),

            // Details Form
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('QUANTITY', style: TextStyle(fontSize: 10, fontWeight: FontWeight.black, color: Colors.black45)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _qtyController,
                        keyboardType: TextInputType.number,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(filled: true, fillColor: Colors.grey[100], border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('UNIT PRICE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.black, color: Colors.black45)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(filled: true, fillColor: Colors.grey[100], border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Total Summary
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('TOTAL AMOUNT', style: TextStyle(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Estimated', style: TextStyle(color: Colors.white38, fontSize: 12)),
                    ],
                  ),
                  Text('RWF ${total.toStringAsFixed(0)}', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.black)),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: _isLoading || _fefoBatch == null ? null : _submitSale,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('AUTHORIZE SALE', style: TextStyle(fontWeight: FontWeight.black, letterSpacing: 1.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
