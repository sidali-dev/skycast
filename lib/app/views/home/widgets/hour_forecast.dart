import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/generated/l10n.dart';
import '../../../data/models/weather/current.dart';
import '../../../helpers/helper_functions.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/constants/images_strings.dart';
import 'precipitation_card.dart';

class HourForecast extends StatelessWidget {
  final Current current;
  const HourForecast({
    super.key,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    final S translations = S.of(context);
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      elevation: 10,
      child: GestureDetector(
        onTap: () => _getWeatherDetails(context, translations),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.card(context),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Text(
                HelperFunctions.parseTime(current.time!),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Image.asset(
                HelperFunctions.getWeatherIcon(
                    current.condition.code, current.isDay),
                height: 36,
              ),
              Text(
                "${current.tempC.floor()}°C",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getWeatherDetails(BuildContext context, S translations) {
    final double screenHeight = HelperFunctions.screenHeight();

    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.card(context),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                translations.hour_details,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Text(
                HelperFunctions.parseTime(current.time!),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              Image.asset(
                  HelperFunctions.getWeatherIcon(
                      current.condition.code, current.isDay),
                  height: screenHeight * 0.08),
              Text(
                '${current.tempC.floor()}°C',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                HelperFunctions.getWeatherCondition(
                    context, current.condition.code, current.isDay),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
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
                        subtitle: "${current.precipMm}${translations.mm}",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WeatherCard(
                        title: translations.wind,
                        image: Transform.rotate(
                          angle: current.windDegree * (pi / 180),
                          child: Image.asset(ImagesStrings.arrow, height: 56),
                        ),
                        subtitle:
                            "${current.windKph.floor()}${translations.km_per_hour}",
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
                        subtitle: "${current.humidity}%",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: WeatherCard(
                        title: translations.uv,
                        image: Image.asset(ImagesStrings.daySunny, height: 56),
                        subtitle: current.uv.floor().toString(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
