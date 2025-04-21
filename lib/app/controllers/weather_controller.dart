import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/data/models/weather/weather.dart';
import 'package:weather_app/app/utils/weather_cache.dart';

import '../services/location_service.dart';
import '../services/weather_service.dart';

class WeatherController extends GetxController {
  final WeatherService _weatherService = Get.find<WeatherService>();
  final LocationService _locationService = Get.find<LocationService>();

  final Rx<Weather?> weather = Rx<Weather?>(null);
  final RxBool isLoading = false.obs;
  late RxInt error = 0.obs;

  String lat = '';
  String lon = '';

  @override
  void onInit() {
    super.onInit();
    getCurrentLocationWeather(true);
  }

  Future<bool> requestLocationPermission() async {
    final response = await _locationService.checkAndRequestLocationPermission();
    return response;
  }

  Future<bool> checkLocationService() async {
    isLoading.value = true;
    final Position? response = await _locationService.getCurrentLocation();
    isLoading.value = false;
    return response != null;
  }

  Future<void> _getLocationForecast(bool checkCache) async {
    final Position? position = await _locationService.getCurrentLocation();

    if (checkCache) {
      // Check cache first
      final cachedData = WeatherCache.getCachedWeatherData();
      if (cachedData != null) {
        weather.value = Weather.fromJson(cachedData);
        return;
      }
    }

    // If no cache or cache expired, fetch new data
    final newWeather = await _weatherService.getForecast(
      position!.latitude.toString(),
      position.longitude.toString(),
    );

    // Cache the new data
    await WeatherCache.cacheWeatherData(newWeather.toJson());

    weather.value = newWeather;
    lat = position.latitude.toString();
    lon = position.longitude.toString();
  }

  Future<bool> isSameLocation() async {
    try {
      isLoading.value = true;
      final Position? position = await _locationService.getCurrentLocation();

      if (position == null) return false;

      // If lat and lon are not set, set them
      if (lat == '' || lon == '') {
        lat = position.latitude.toString();
        lon = position.longitude.toString();
        return false;
      }

      // Allow for small differences in GPS coordinates (approximately 1000 meters)
      const double tolerance = 0.01;

      final currentLat = position.latitude;
      final currentLon = position.longitude;

      final storedLat = double.tryParse(lat);
      final storedLon = double.tryParse(lon);

      return (currentLat - storedLat!).abs() < tolerance &&
          (currentLon - storedLon!).abs() < tolerance;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCurrentLocationWeather(bool checkCache) async {
    try {
      isLoading.value = true;

      await _locationService.checkAndRequestLocationPermission();

      if (!_locationService.hasLocationPermission.value) {
        error.value = 1;
        return;
      }

      await _locationService.checkAndEnableLocationService();

      if (!_locationService.isLocationEnabled.value) {
        error.value = 2;
        return;
      }

      await _getLocationForecast(checkCache);
      error.value = 0;
    } catch (e) {
      error.value = 3;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateWeatherByLocation(String lat, String lon) async {
    try {
      isLoading.value = true;

      final response = await _weatherService.getForecast(lat, lon);

      // Cache the new data
      await WeatherCache.cacheWeatherData(response.toJson());

      this.lat = lat;
      this.lon = lon;
      weather.value = response;
      Get.showSnackbar(
        GetSnackBar(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          borderRadius: 16,
          title: "Location Updated",
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          message: "Weather updated to current location",
          icon: Icon(Icons.location_on_outlined),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      error.value = 3;
    } finally {
      isLoading.value = false;
    }
  }
}
