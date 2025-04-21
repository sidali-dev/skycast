import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/views/home/widgets/day_forecast.dart';

import '../controllers/upcoming_days_controller.dart';
import '../helpers/helper_functions.dart';
import '../theme/app_colors.dart';
import '../utils/constants/images_strings.dart';
import 'home/widgets/hour_forecast.dart';
import 'home/widgets/precipitation_card.dart';

class UpcomingDays extends GetView<UpcomingDaysController> {
  const UpcomingDays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.background(context),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 28),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Upcoming Days",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Obx(
                () => Row(
                  children: controller.forecastdays.map(
                    (e) {
                      if (e.date.day == DateTime.now().day) {
                        return SizedBox.shrink();
                      }
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => controller.changeSelectedDay(e.date.day),
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 16, left: 16, bottom: 48),
                            child: DayForecast(
                              forecastDay: e,
                              isSelected:
                                  controller.selectedDay.value == e.date.day,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.access_time_rounded, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "Hourly Forecast",
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
                child: Obx(
                  () => Row(
                    children: controller.selectedForecastday.value!.hour
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  right: 8, left: 8, bottom: 32),
                              child: HourForecast(current: e),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Text(
                "Weather Details",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: WeatherCard(
                          title: "Precipitation",
                          image: Image.asset(
                            ImagesStrings.heavyRain,
                            height: 56,
                          ),
                          subtitle:
                              "${controller.selectedForecastday.value!.day.totalprecipMm}mm",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: WeatherCard(
                          title: "Wind",
                          image: Transform.rotate(
                            angle: HelperFunctions.getAvgWindDegree(controller
                                    .selectedForecastday.value!.hour) *
                                (pi / 180),
                            child: Image.asset(ImagesStrings.arrow, height: 56),
                          ),
                          subtitle:
                              "${HelperFunctions.getAvgWindSpeed(controller.selectedForecastday.value!.hour)}km/h",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: WeatherCard(
                          title: "Humidity",
                          image:
                              Image.asset(ImagesStrings.humidity, height: 56),
                          subtitle:
                              "${controller.selectedForecastday.value!.day.avghumidity}%",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: WeatherCard(
                          title: "UV",
                          image:
                              Image.asset(ImagesStrings.daySunny, height: 56),
                          subtitle: controller.selectedForecastday.value!.day.uv
                              .floor()
                              .toString(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
