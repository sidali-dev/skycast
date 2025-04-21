import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/location/location_object.dart';
import '../services/location_service.dart';
import 'weather_controller.dart';

class LocationSearchController extends GetxController {
  final RxList<LocationObject> searchResults = <LocationObject>[].obs;
  final RxBool isLoading = false.obs;
  final TextEditingController searchController = TextEditingController();
  WeatherController weatherController = Get.find<WeatherController>();

  Future<void> updateWeatherByLocation(LocationObject location) async {
    await weatherController.updateWeatherByLocation(location.lat, location.lon);
  }

  void searchLocations(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }

    isLoading.value = true;
    final results = await LocationService.searchLocations(query);
    searchResults.value = results;
    isLoading.value = false;
  }

  void clearSearch() {
    searchController.clear();
    searchResults.clear();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
