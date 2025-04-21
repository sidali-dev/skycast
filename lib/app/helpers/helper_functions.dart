import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../generated/l10n.dart';
import '../data/models/weather/current.dart';
import '../utils/constants/images_strings.dart';

class HelperFunctions {
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String parseDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd MMM yyyy').format(parsedDate);
  }

  static String parseTime(String time) {
    final DateTime parsedTime = DateTime.parse(time);
    return DateFormat('HH:mm').format(parsedTime);
  }

  static String parseDay(String day) {
    final DateTime parsedDay = DateTime.parse(day);
    return DateFormat('EE').format(parsedDay);
  }

  static String getWeatherIcon(int code, int isDay) {
    bool isDayTime = isDay == 1;
    switch (code) {
      case 1000:
        return isDayTime ? ImagesStrings.daySunny : ImagesStrings.nightClear;
      case 1003:
        return isDayTime
            ? ImagesStrings.dayPartlyCloudy
            : ImagesStrings.nightPartlyCloudy;
      case 1006:
        return isDayTime ? ImagesStrings.dayCloudy : ImagesStrings.nightCloudy;
      case 1009:
        return ImagesStrings.overcast;
      case 1030:
        return ImagesStrings.mist;
      case 1063:
        return isDayTime ? ImagesStrings.dayRain : ImagesStrings.nightRain;
      case 1066:
        return ImagesStrings.patchySnow;
      case 1069:
        return ImagesStrings.patchySleet;
      case 1072:
        return ImagesStrings.patchyFreezingDrizzle;
      case 1087:
        return ImagesStrings.thunderyOutbreaks;
      case 1114:
        return ImagesStrings.patchySnow;
      case 1117:
        return ImagesStrings.blizzard;
      case 1135:
        return ImagesStrings.mist;
      case 1147:
        return ImagesStrings.freezingMist;
      case 1150:
        return ImagesStrings.rain;
      case 1153:
        return ImagesStrings.rain;
      case 1168:
        return ImagesStrings.patchyFreezingDrizzle;
      case 1171:
        return ImagesStrings.heavyFreezingDrizzle;
      case 1180:
        return ImagesStrings.rain;
      case 1183:
        return ImagesStrings.rain;
      case 1186:
        return ImagesStrings.rain;
      case 1189:
        return ImagesStrings.rain;
      case 1192:
        return ImagesStrings.heavyRain;
      case 1195:
        return ImagesStrings.heavyRain;
      case 1198:
        return ImagesStrings.patchyFreezingDrizzle;
      case 1201:
        return ImagesStrings.heavyFreezingDrizzle;
      case 1204:
        return ImagesStrings.patchySleet;
      case 1207:
        return ImagesStrings.heavySleet;
      case 1210:
        return ImagesStrings.patchySnow;
      case 1213:
        return ImagesStrings.patchySnow;
      case 1216:
        return ImagesStrings.patchySnow;
      case 1219:
        return ImagesStrings.patchySnow;
      case 1222:
        return ImagesStrings.heavySnow;
      case 1225:
        return ImagesStrings.heavySnow;
      case 1237:
        return ImagesStrings.icePallets;
      case 1240:
        return ImagesStrings.rain;
      case 1243:
        return ImagesStrings.heavyRain;
      case 1246:
        return ImagesStrings.heavyRain;
      case 1249:
        return ImagesStrings.patchyFreezingDrizzle;
      case 1252:
        return ImagesStrings.heavyFreezingDrizzle;
      case 1255:
        return ImagesStrings.patchySnow;
      case 1258:
        return ImagesStrings.heavySnow;
      case 1261:
        return ImagesStrings.icePallets;
      case 1264:
        return ImagesStrings.icePallets;
      case 1273:
        return ImagesStrings.blizzard;
      case 1276:
        return ImagesStrings.blizzard;
      case 1279:
        return ImagesStrings.lightSnowThunder;
      case 1282:
        return ImagesStrings.lightSnowThunder;
      default:
        return isDayTime ? ImagesStrings.daySunny : ImagesStrings.nightClear;
    }
  }

  static double getAvgWindDegree(List<Current> hours) {
    double total = 0;
    for (var hour in hours) {
      total += hour.windDegree;
    }
    return total / hours.length;
  }

  static int getAvgWindSpeed(List<Current> hours) {
    double total = 0;
    for (var hour in hours) {
      total += hour.windKph;
    }
    return total ~/ hours.length;
  }

  static String getWeatherCondition(BuildContext context, int code, int isDay) {
    final S translations = S.of(context);
    bool isDayTime = isDay == 1;

    switch (code) {
      case 1000:
        return isDayTime ? translations.sunny : translations.clear;
      case 1003:
        return translations.partly_cloudy;
      case 1006:
        return translations.cloudy;
      case 1009:
        return translations.overcast;
      case 1030:
        return translations.mist;
      case 1063:
        return translations.patchy_rain_possible;
      case 1066:
        return translations.patchy_snow_possible;
      case 1069:
        return translations.patchy_sleet_possible;
      case 1072:
        return translations.patchy_freezing_drizzle_possible;
      case 1087:
        return translations.thundery_outbreaks_possible;
      case 1114:
        return translations.blowing_snow;
      case 1117:
        return translations.blizzard;
      case 1135:
        return translations.fog;
      case 1147:
        return translations.freezing_fog;
      case 1150:
        return translations.patchy_light_drizzle;
      case 1153:
        return translations.light_drizzle;
      case 1168:
        return translations.freezing_drizzle;
      case 1171:
        return translations.heavy_freezing_drizzle;
      case 1180:
        return translations.patchy_light_rain;
      case 1183:
        return translations.light_rain;
      case 1186:
        return translations.moderate_rain_at_times;
      case 1189:
        return translations.moderate_rain;
      case 1192:
        return translations.heavy_rain_at_times;
      case 1195:
        return translations.heavy_rain;
      case 1198:
        return translations.light_freezing_rain;
      case 1201:
        return translations.moderate_or_heavy_freezing_rain;
      case 1204:
        return translations.light_sleet;
      case 1207:
        return translations.moderate_or_heavy_sleet;
      case 1210:
        return translations.patchy_light_snow;
      case 1213:
        return translations.light_snow;
      case 1216:
        return translations.patchy_moderate_snow;
      case 1219:
        return translations.moderate_snow;
      case 1222:
        return translations.patchy_heavy_snow;
      case 1225:
        return translations.heavy_snow;
      case 1237:
        return translations.ice_pellets;
      case 1240:
        return translations.light_rain_shower;
      case 1243:
        return translations.moderate_or_heavy_rain_shower;
      case 1246:
        return translations.torrential_rain_shower;
      case 1249:
        return translations.light_sleet_showers;
      case 1252:
        return translations.moderate_or_heavy_sleet_showers;
      case 1255:
        return translations.light_snow_showers;
      case 1258:
        return translations.moderate_or_heavy_snow_showers;
      case 1261:
        return translations.light_showers_of_ice_pellets;
      case 1264:
        return translations.moderate_or_heavy_showers_of_ice_pellets;
      case 1273:
        return translations.patchy_light_rain_with_thunder;
      case 1276:
        return translations.moderate_or_heavy_rain_with_thunder;
      case 1279:
        return translations.patchy_light_snow_with_thunder;
      case 1282:
        return translations.moderate_or_heavy_snow_with_thunder;
      default:
        return isDayTime ? translations.sunny : translations.clear;
    }
  }
}
