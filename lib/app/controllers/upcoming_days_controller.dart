import 'package:get/get.dart';

import '../data/models/weather/forecast_day.dart';

class UpcomingDaysController extends GetxController {
  final List<Forecastday> forecastdays;
  final Rx<int> selectedDay;
  final Rx<Forecastday?> selectedForecastday = Rx<Forecastday?>(null);

  UpcomingDaysController({
    required this.forecastdays,
    required this.selectedDay,
  });

  @override
  void onInit() {
    super.onInit();
    getSelectedForecastday();
  }

  changeSelectedDay(int day) {
    selectedDay.value = day;
    getSelectedForecastday();
  }

  getSelectedForecastday() {
    selectedForecastday.value = forecastdays
        .where((element) => element.date.day == selectedDay.value)
        .first;
  }
}
