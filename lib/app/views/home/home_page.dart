import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/routes/app_routes.dart';
import 'package:weather_app/app/views/home/widgets/hour_forecast.dart';
import 'package:weather_app/app/utils/constants/enums.dart';

import '../../../generated/l10n.dart';
import '../../controllers/weather_controller.dart';
import '../../helpers/helper_functions.dart';
import '../../theme/app_colors.dart';
import '../../utils/constants/images_strings.dart';
import 'widgets/day_forecast.dart';
import 'widgets/precipitation_card.dart';
import '../../controllers/language_controller.dart';

class HomePage extends GetView<WeatherController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = HelperFunctions.screenHeight();
    final S translations = S.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.background(context),
          ),
        ),
        child: Obx(() {
          if (controller.isLoading.value) {
            return _buildLoadingScreen(screenHeight, translations);
          } else if (controller.error.value != 0) {
            return _buildErrorScreen(screenHeight, translations);
          } else {
            return _buildSuccessScreen(screenHeight, context, translations);
          }
        }),
      ),
    );
  }

  Widget _buildSuccessScreen(
      double screenHeight, BuildContext context, S translations) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () async {
                      if (!await controller.isSameLocation()) {
                        await controller.getCurrentLocationWeather(false);
                        Get.showSnackbar(
                          GetSnackBar(
                            margin: EdgeInsets.all(16),
                            padding: EdgeInsets.all(16),
                            borderRadius: 16,
                            title: translations.location_updated,
                            backgroundColor:
                                Colors.white.withValues(alpha: 0.2),
                            message: translations.weather_updated,
                            icon: Icon(Icons.location_on_outlined),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        Get.showSnackbar(
                          GetSnackBar(
                            margin: EdgeInsets.all(16),
                            padding: EdgeInsets.all(16),
                            borderRadius: 16,
                            title: translations.location_didnt_change,
                            backgroundColor:
                                Colors.white.withValues(alpha: 0.2),
                            message: translations.you_are_in_the_same_location,
                            icon: Icon(Icons.location_off_outlined),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      _buildLanguageBottomSheet(context, translations);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                      child: const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.SEARCH);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
              Text(
                HelperFunctions.parseDate(
                    controller.weather.value!.location.localtime),
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "${controller.weather.value!.location.name}, ${controller.weather.value!.location.region}",
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Image.asset(
                  HelperFunctions.getWeatherIcon(
                      controller.weather.value!.current.condition.code,
                      controller.weather.value!.current.isDay),
                  height: screenHeight * 0.15),
              Text(
                '${controller.weather.value!.current.tempC.floor()}°C',
                style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                HelperFunctions.getWeatherCondition(
                    context,
                    controller.weather.value!.current.condition.code,
                    controller.weather.value!.current.isDay),
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Divider(
                color: Colors.white.withValues(alpha: 0.5),
                indent: 80,
                endIndent: 80,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_rounded, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    translations.hourly_forecast,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller
                      .weather.value!.forecast.forecastday[0].hour
                      .map((e) => Padding(
                            padding:
                                EdgeInsets.only(right: 8, left: 8, bottom: 32),
                            child: HourForecast(current: e),
                          ))
                      .toList(),
                ),
              ),
              Text(
                translations.upcoming_days,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                children: controller.weather.value!.forecast.forecastday.map(
                  (e) {
                    if (e.date.day == DateTime.now().day) {
                      return SizedBox.shrink();
                    }
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.UPCOMING_DAYS, arguments: {
                            'forecast_days':
                                controller.weather.value!.forecast.forecastday,
                            'selected_day': e.date.day.obs,
                          });
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: 16, left: 16, bottom: 48),
                          child: DayForecast(forecastDay: e),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              Text(
                translations.weather_details,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WeatherCard(
                        title: translations.percipitation,
                        image: Image.asset(
                          ImagesStrings.heavyRain,
                          height: 56,
                        ),
                        subtitle:
                            "${controller.weather.value!.forecast.forecastday[0].day.totalprecipMm}mm",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WeatherCard(
                        title: translations.wind,
                        image: Transform.rotate(
                          angle: controller.weather.value!.current.windDegree *
                              (pi / 180),
                          child: Image.asset(ImagesStrings.arrow, height: 56),
                        ),
                        subtitle:
                            "${controller.weather.value!.current.windKph.floor()} ${translations.km_per_hour}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WeatherCard(
                        title: translations.humidity,
                        image: Image.asset(ImagesStrings.humidity, height: 56),
                        subtitle:
                            "${controller.weather.value!.current.humidity}%",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WeatherCard(
                        title: translations.uv,
                        image: Image.asset(ImagesStrings.daySunny, height: 56),
                        subtitle: controller.weather.value!.current.uv
                            .floor()
                            .toString(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingScreen(double screenHeight, S translations) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          ImagesStrings.weatherLoading,
          height: screenHeight * 0.25,
        ),
        SizedBox(height: 16),
        Text(
          translations.loading,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildErrorScreen(double screenHeight, S translations) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          controller.error.value == 1
              ? ImagesStrings.locationPermission
              : controller.error.value == 2
                  ? ImagesStrings.locationService
                  : ImagesStrings.weatherError,
          height: screenHeight * 0.25,
        ),
        SizedBox(height: 32),
        Text(
          controller.error.value == 1
              ? translations.location_permission_denied
              : controller.error.value == 2
                  ? translations.location_service_disabled
                  : translations.error_getting_weather,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
          child: Obx(
            () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDDB130),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () async {
                if (controller.isLoading.value) {
                  return;
                }
                if (controller.error.value == 1) {
                  await controller.requestLocationPermission().then(
                    (value) async {
                      if (value) {
                        await controller.checkLocationService().then(
                          (value) async {
                            if (value) {
                              await controller.getCurrentLocationWeather(true);
                              controller.error.value = 0;
                            }
                          },
                        );
                      }
                    },
                  );
                } else if (controller.error.value == 2) {
                  await controller.checkLocationService().then(
                    (value) async {
                      if (value) {
                        await controller.getCurrentLocationWeather(true);
                        controller.error.value = 0;
                      }
                    },
                  );
                } else {
                  await controller.getCurrentLocationWeather(true);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: controller.isLoading.value
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: const CircularProgressIndicator(
                          color: Color(0xFF362A84),
                        ),
                      )
                    : Text(
                        controller.error.value == 1
                            ? translations.request_location_permission
                            : controller.error.value == 2
                                ? translations.check_location_service
                                : translations.try_again,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF362A84),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildLanguageBottomSheet(BuildContext context, S translations) {
    final languageController = Get.put(LanguageController());
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.card(context),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              translations.select_language,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            ...Language.values.map((language) {
              final isSelected =
                  languageController.getCurrentLanguage() == language.name;
              return ListTile(
                leading: isSelected
                    ? Icon(Icons.check_circle, color: Colors.white)
                    : Icon(Icons.circle_outlined, color: Colors.white),
                title: Text(
                  languageController.getLanguageTitle(language),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  languageController.changeCurrentLanguage(language.name);
                  Get.back();
                },
              );
            }),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
