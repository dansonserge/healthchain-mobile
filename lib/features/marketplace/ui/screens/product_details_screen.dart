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
  final Set<Marker> _markers = {};

  final LatLng _initialPosition = const LatLng(-1.9441, 30.0619); // Kigali

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
                                    _buildCircleButton(Icons.favorite_border, () {}),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Floating Selected Listing Card (Web Replicated)
                        if (_selectedListing != null)
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: _buildFloatingMapCard(_selectedListing!, isDarkMode),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${listing.currency} ${listing.price.toInt()}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                _buildDirectionsButton(listing),
              ],
            ),
          ],
        ),
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

  Widget _buildFloatingMapCard(MarketplaceListing listing, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: listing.productImage != null
                ? CachedNetworkImage(imageUrl: listing.productImage!, width: 50, height: 50, fit: BoxFit.cover)
                : Container(width: 50, height: 50, color: Colors.grey[200]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(listing.sellerName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text('${listing.distanceKm.toStringAsFixed(1)} KM Away', style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
          _buildCircleButton(Icons.close, () => setState(() => _selectedListing = null)),
        ],
      ),
    );
  }

  void _updateMarkers(List<MarketplaceListing> listings) {
    _markers.clear();
    for (var l in listings) {
      _markers.add(
        Marker(
          markerId: MarkerId(l.id),
          position: LatLng(l.lat, l.lng),
          onTap: () => _selectListing(l),
        ),
      );
    }
  }

  void _selectListing(MarketplaceListing listing) {
    setState(() => _selectedListing = listing);
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(listing.lat - 0.005, listing.lng), zoom: 15), // Offset slightly to accommodate floating card
      ),
    );
  }

  Future<void> _showDirections(MarketplaceListing listing) async {
    final availableMaps = await launcher.MapLauncher.installedMaps;
    if (context.mounted) {
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
