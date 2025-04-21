import 'package:flutter/material.dart';
import 'package:weather_app/app/data/models/weather/forecast_day.dart';
import 'package:weather_app/generated/l10n.dart';

import '../../../helpers/helper_functions.dart';
import '../../../theme/app_colors.dart';

class DayForecast extends StatelessWidget {
  const DayForecast({
    super.key,
    required this.forecastDay,
    this.isSelected = false,
  });

  final Forecastday forecastDay;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    final S translations = S.of(context);
    bool isTomorrow = forecastDay.date.day == DateTime.now().day + 1;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.card(context),
          ),
          color:
              isSelected == true ? Colors.black.withValues(alpha: 0.2) : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              isTomorrow
                  ? translations.tomorrow
                  : HelperFunctions.parseDay(forecastDay.date.toString()),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              HelperFunctions.parseDate(forecastDay.date.toString()),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Image.asset(
              HelperFunctions.getWeatherIcon(forecastDay.day.condition.code, 1),
              height: 36,
            ),
            Text(
              "${forecastDay.day.mintempC}°C",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(
              "${forecastDay.day.maxtempC}°C",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
