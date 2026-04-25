import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart' as launcher;
import 'package:share_plus/share_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/marketplace_repository.dart';
import '../../domain/marketplace_models.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  GoogleMapController? _mapController;
  MarketplaceListing? _selectedListing;
  final Map<String, int> _cart = {}; // ID -> quantity
  final Set<Marker> _markers = {};

  final LatLng _initialPosition = const LatLng(-1.9441, 30.0619); // Kigali

  late final TextEditingController _qtyController;

  @override
  void initState() {
    super.initState();
    _qtyController = TextEditingController(text: '1');
  }

  @override
  void dispose() {
    _qtyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final suppliersAsync = ref.watch(productSuppliersProvider(widget.productId));
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Top Map Layer
          suppliersAsync.when(
            data: (listings) {
              _updateMarkers(listings);
              return Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition: CameraPosition(target: _initialPosition, zoom: 12),
                          onMapCreated: (controller) => _mapController = controller,
                          markers: _markers,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          mapToolbarEnabled: false,
                          style: isDarkMode ? _mapDarkModeStyle : null,
                        ),
                        // Top Bar Actions
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildCircleButton(Icons.arrow_back, () => Navigator.pop(context)),
                                Row(
                                  children: [
                                    _buildCircleButton(Icons.share_outlined, () {
                                      final first = listings.first;
                                      Share.share('Check out ${first.productName} on HealthChain Marketplace!');
                                    }),
                                    const SizedBox(width: 12),
                                    _buildCircleButton(Icons.directions_outlined, () {
                                      final target = _selectedListing ?? listings.first;
                                      _showDirections(target);
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(flex: 6, child: SizedBox()), // Placeholder for bottom content
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator(color: Colors.black)),
            error: (e, s) => Center(child: Text('Error: $e')),
          ),

          // 2. Bottom Listings Layer (Draggable Scrollable)
          suppliersAsync.when(
            data: (listings) => DraggableScrollableSheet(
              initialChildSize: 0.55,
              minChildSize: 0.55,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: _buildProductHeader(listings.first, isDarkMode),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final listing = listings[index];
                                final isSelected = _selectedListing?.id == listing.id;
                                return _buildListingRow(listing, isSelected, isDarkMode);
                              },
                              childCount: listings.length,
                            ),
                          ),
                        ),
                        const SliverToBoxAdapter(child: SizedBox(height: 100)),
                      ],
                    ),
                  ),
                );
              },
            ),
            loading: () => const SizedBox(),
            error: (e, s) => const SizedBox(),
          ),

          // 3. Floating Cart Summary Bar
          suppliersAsync.when(
            data: (listings) {
              if (_cart.isEmpty) return const SizedBox.shrink();

              double total = 0;
              for (var entry in _cart.entries) {
                final listing = listings.firstWhere((l) => l.id == entry.key, 
                  orElse: () => listings.first);
                total += listing.price * entry.value;
              }

              return Positioned(
                bottom: 24,
                left: 16,
                right: 16,
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_cart.length} ${_cart.length == 1 ? 'Supplier' : 'Suppliers'}',
                              style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'RWF ${total.toInt()}',
                              style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Cart Screen
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'View Cart',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios, size: 12, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (e, s) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: Colors.black),
      ),
    );
  }

  Widget _buildProductHeader(MarketplaceListing first, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MARKETPLACE CATALOG',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  first.productName,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -1),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildTag(Icons.verified_user_outlined, 'Certified Suppliers'),
                    const SizedBox(width: 8),
                    _buildTag(Icons.check_circle_outline, 'Verified Supply Chain'),
                  ],
                ),
              ],
            ),
          ),
          if (first.productImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: first.productImage!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTag(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 12, color: Colors.grey),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildListingRow(MarketplaceListing listing, bool isSelected, bool isDarkMode) {
    final isInCart = _cart.containsKey(listing.id);
    final cartQty = _cart[listing.id] ?? 0;

    return GestureDetector(
      onTap: () => _selectListing(listing),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withValues(alpha: 0.05) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.black : (isDarkMode ? Colors.white12 : Colors.grey.shade200),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: listing.sellerLogo != null 
                ? CachedNetworkImage(imageUrl: listing.sellerLogo!)
                : const Icon(Icons.business, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listing.sellerName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(
                    'BN: ${listing.batchNumber}  ·  EXP: ${listing.expiryDate}',
                    style: const TextStyle(fontSize: 8, color: Colors.grey),
                  ),
                  Text(
                    '${listing.quantity} Units Available',
                    style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w500, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Quantity Column
            if (isInCart)
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () => _showQuantityModal(listing),
                  child: Column(
                    children: [
                      const Text('Quantity', style: TextStyle(fontSize: 8, color: Colors.grey, fontWeight: FontWeight.bold)),
                      Text('$cartQty', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            const SizedBox(width: 8),
            // Price & Directions
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${listing.currency} ${listing.price.toInt()}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                _buildDirectionsButton(listing),
              ],
            ),
            const SizedBox(width: 12),
            // Cart Actions
            if (!isInCart)
              _buildAddAction(() => _showQuantityModal(listing))
            else
              _buildRemoveAction(() {
                setState(() => _cart.remove(listing.id));
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildAddAction(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.shopping_cart_outlined, size: 16, color: Colors.white),
      ),
    );
  }

  Widget _buildRemoveAction(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.pinkAccent.withValues(alpha: 0.2), width: 1),
        ),
        child: const Icon(Icons.delete_outline, size: 16, color: Colors.pinkAccent),
      ),
    );
  }

  Widget _buildDirectionsButton(MarketplaceListing listing) {
    return InkWell(
      onTap: () => _showDirections(listing),
      child: Row(
        children: [
          const Icon(Icons.directions_outlined, size: 12, color: Colors.blueAccent),
          const SizedBox(width: 4),
          Text(
            '${listing.distanceKm.toStringAsFixed(1)} KM',
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }



  void _updateMarkers(List<MarketplaceListing> listings) {
    _markers.clear();
    for (var l in listings) {
      final isSelected = _selectedListing?.id == l.id;
      _markers.add(
        Marker(
          markerId: MarkerId(l.id),
          position: LatLng(l.lat, l.lng),
          onTap: () => _selectListing(l),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            isSelected ? BitmapDescriptor.hueAzure : BitmapDescriptor.hueRed,
          ),
          zIndex: isSelected ? 2 : 1,
        ),
      );
    }
  }

  void _selectListing(MarketplaceListing listing) {
    setState(() {
      _selectedListing = listing;
    });
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(listing.lat, listing.lng),
          zoom: 18.0, // Deep cinematic zoom
          tilt: 45.0, // Cinematic tilt
          bearing: 0,
        ),
      ),
    );
  }

  void _showQuantityModal(MarketplaceListing listing) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // Set initial quantity from cart if possible
    final currentQty = _cart[listing.id] ?? 1;
    _qtyController.text = currentQty.toString();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          final q = int.tryParse(_qtyController.text) ?? 1;
          
          return Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 20, offset: const Offset(0, 10))
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.black26 : Colors.grey[50],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: listing.sellerLogo != null
                              ? CachedNetworkImage(imageUrl: listing.sellerLogo!)
                              : const Icon(Icons.business, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listing.sellerName,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: -0.7),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                _buildMiniTag('BATCH ${listing.batchNumber}'),
                                const SizedBox(width: 8),
                                _buildMiniTag('EXP ${listing.expiryDate}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Divider(height: 1, thickness: 0.5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('QUANTITY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2)),
                          const SizedBox(height: 12),
                          Container(
                            width: 130,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: isDarkMode ? Colors.black26 : Colors.grey[100],
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              children: [
                                _buildQtyBtn(Icons.remove, () {
                                  final val = int.tryParse(_qtyController.text) ?? 1;
                                  if (val > 1) {
                                    setModalState(() => _qtyController.text = (val - 1).toString());
                                  }
                                }),
                                Expanded(
                                  child: TextField(
                                    controller: _qtyController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: (_) => setModalState(() {}),
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                                    ),
                                  ),
                                ),
                                _buildQtyBtn(Icons.add, () {
                                  final val = int.tryParse(_qtyController.text) ?? 1;
                                  if (val < listing.quantity) {
                                    setModalState(() => _qtyController.text = (val + 1).toString());
                                  }
                                }),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text('${listing.quantity} units available', style: TextStyle(fontSize: 10, color: Colors.green.shade600, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('ESTIMATED TOTAL', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2)),
                          const SizedBox(height: 8),
                          Text(
                            '${listing.currency} ${(listing.price * q).toInt()}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26, letterSpacing: -1.2),
                          ),
                          const SizedBox(height: 4),
                          Text('RWF ${listing.price.toInt()} per unit', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final finalQty = int.tryParse(_qtyController.text) ?? 1;
                        setState(() => _cart[listing.id] = finalQty);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added $finalQty units to cart from ${listing.sellerName}'),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart_outlined, size: 20),
                      label: const Text('Add to Cart', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.8)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMiniTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black54),
      ),
    );
  }

  Widget _buildQtyBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, size: 16, color: Colors.black54),
      ),
    );
  }

  Future<void> _showDirections(MarketplaceListing listing) async {
    final availableMaps = await launcher.MapLauncher.installedMaps;
    if (!mounted) return;
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(title: Text('Navigation Apps', style: TextStyle(fontWeight: FontWeight.bold))),
            ...availableMaps.map((map) => ListTile(
              title: Text(map.mapName),
              leading: CachedNetworkImage(imageUrl: map.icon, width: 30),
              onTap: () => map.showMarker(coords: launcher.Coords(listing.lat, listing.lng), title: listing.sellerName),
            )),
          ],
        ),
      ),
    );
  }

  static const String _mapDarkModeStyle = '''[
  {
    "elementType": "geometry",
    "stylers": [{"color": "#242f3e"}]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#746855"}]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [{"color": "#242f3e"}]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#d59563"}]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#d59563"}]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [{"color": "#263c3f"}]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#6b9a76"}]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [{"color": "#38414e"}]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [{"color": "#212a37"}]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#9ca5b3"}]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [{"color": "#746855"}]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [{"color": "#1f2835"}]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#f3d19c"}]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [{"color": "#17263c"}]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#515c6d"}]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [{"color": "#17263c"}]
  }
]''';
}
