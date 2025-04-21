import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../generated/l10n.dart';
import '../../controllers/search_controller.dart';
import '../../data/models/location/location_object.dart';
import '../../theme/app_colors.dart';

class SearchPage extends GetView<LocationSearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final S translations = S.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.background(context),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              //APP BAR
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 28),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    translations.search_city,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              //SEARCH FIELD
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: controller.searchController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: translations.enter_city_name,
                    hintStyle: const TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent)),
                    prefixIcon: const Icon(Icons.search, color: Colors.black54),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.black54),
                      onPressed: controller.clearSearch,
                    ),
                  ),
                  onChanged: controller.searchLocations,
                ),
              ),

              //SEARCH RESULTS
              _buildSearchResults(translations),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults(S translations) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Expanded(
          child: Center(
            child: Text(
              translations.searching,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      if (controller.searchController.text.isEmpty) {
        return Expanded(
          child: Center(
            child: Text(
              translations.enter_city_name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      if (controller.searchResults.isEmpty) {
        return Expanded(
          child: Center(
            child: Text(
              translations.no_results_found,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      return Expanded(
        child: ListView.separated(
          itemCount: controller.searchResults.length,
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.white.withValues(alpha: 0.2),
              height: 1,
            );
          },
          itemBuilder: (context, index) {
            final LocationObject location = controller.searchResults[index];
            return ListTile(
              leading: Icon(Icons.location_on, color: Colors.white),
              title: Text(
                location.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                location.displayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                controller.updateWeatherByLocation(location);
                Get.back();
              },
            );
          },
        ),
      );
    });
  }
}
