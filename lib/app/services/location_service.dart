import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../data/models/location/location_object.dart';

class LocationService extends GetxService {
  final RxBool hasLocationPermission = false.obs;
  final RxBool isLocationEnabled = false.obs;

  Future<bool> checkAndRequestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      await openLocationSettings();
    }

    hasLocationPermission.value = permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
    return hasLocationPermission.value;
  }

  Future<bool> checkAndEnableLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    isLocationEnabled.value = serviceEnabled;
    return serviceEnabled;
  }

  Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      );
    } catch (e) {
      return null;
    }
  }

  static Future<List<LocationObject>> searchLocations(String query) async {
    try {
      final response = await Dio().get(
        'https://nominatim.openstreetmap.org/search?format=json&q=$query',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) => LocationObject.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<void> openLocationSettings() async {
    await Geolocator.openAppSettings();
  }
}
