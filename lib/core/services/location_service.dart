import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final locationServiceProvider = Provider<Location>((ref) {
  return Location();
});

final userLocationProvider = StreamProvider<LocationData>((ref) async* {
  final location = ref.watch(locationServiceProvider);
  
  bool serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) return;
  }

  PermissionStatus permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) return;
  }

  yield* location.onLocationChanged;
});

// A simpler provider that just gets the current location once
final currentPositionProvider = FutureProvider<LocationData>((ref) async {
  final location = ref.watch(locationServiceProvider);
  return await location.getLocation();
});
