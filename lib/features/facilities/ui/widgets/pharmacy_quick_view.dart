import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/facility_repository.dart';
import '../../domain/facility_models.dart';
import '../../../../core/services/location_service.dart';

class PharmacyQuickView extends ConsumerWidget {
  const PharmacyQuickView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsync = ref.watch(currentPositionProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'NEAREST PHARMACIES',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        locationAsync.when(
          data: (location) {
            final pharmaciesAsync = ref.watch(
              nearbyPharmaciesProvider((location.latitude ?? -1.9441, location.longitude ?? 30.0619))
            );

            return pharmaciesAsync.when(
              data: (pharmacies) => SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: pharmacies.length,
                  itemBuilder: (context, index) {
                    final pharmacy = pharmacies[index];
                    return _PharmacyCard(pharmacy: pharmacy);
                  },
                ),
              ),
              loading: () => _LoadingShimmer(),
              error: (e, s) => const SizedBox(),
            );
          },
          loading: () => _LoadingShimmer(),
          error: (e, s) => const SizedBox(),
        ),
      ],
    );
  }
}

class _PharmacyCard extends StatelessWidget {
  final Facility pharmacy;

  const _PharmacyCard({required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode ? Colors.white10 : Colors.grey[200]!,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: pharmacy.isOpen ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    pharmacy.isOpen ? 'OPEN' : 'CLOSED',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: pharmacy.isOpen ? Colors.green : Colors.red,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '${pharmacy.distanceKm.toStringAsFixed(1)} km',
                  style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              pharmacy.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              pharmacy.address,
              style: TextStyle(fontSize: 11, color: isDarkMode ? Colors.white38 : Colors.grey[600]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.phone_rounded, size: 12, color: Colors.grey[400]),
                const SizedBox(width: 4),
                Text(
                  pharmacy.phone,
                  style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 140,
      child: Center(child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2)),
    );
  }
}
