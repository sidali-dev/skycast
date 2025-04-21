import 'package:get/get.dart';
import 'package:weather_app/app/routes/app_routes.dart';
import 'package:weather_app/app/views/home/home_page.dart';
import 'package:weather_app/app/views/search/search_page.dart';

import '../controllers/search_controller.dart';
import '../controllers/upcoming_days_controller.dart';
import '../controllers/weather_controller.dart';
import '../services/location_service.dart';
import '../services/weather_service.dart';
import '../views/upcoming_days.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        Get.put(LocationService());
        Get.put(WeatherService());
        Get.put(WeatherController());
      }),
    ),
    GetPage(
      name: AppRoutes.SEARCH,
      page: () => const SearchPage(),
      binding: BindingsBuilder(
        () {
          Get.put(LocationSearchController());
        },
      ),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.UPCOMING_DAYS,
      page: () => const UpcomingDays(),
      binding: BindingsBuilder(
        () {
          final args = Get.arguments;
          Get.put(UpcomingDaysController(
              forecastdays: args['forecast_days'],
              selectedDay: args['selected_day']));
        },
      ),
      transition: Transition.fade,
    ),
  ];
}
