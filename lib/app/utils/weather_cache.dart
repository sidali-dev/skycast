import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class WeatherCache {
  static final GetStorage _storage = GetStorage();
  static const String _weatherDataKey = 'weather_data';
  static const String _lastUpdateDateKey = 'last_update_date';

  // Store weather data and current date
  static Future<void> cacheWeatherData(Map<String, dynamic> weatherData) async {
    await _storage.write(_weatherDataKey, weatherData);
    await _storage.write(_lastUpdateDateKey, _getCurrentDate());
  }

  // Get cached weather data if it's from today
  static Map<String, dynamic>? getCachedWeatherData() {
    final lastUpdateDate = _storage.read<String>(_lastUpdateDateKey);
    if (lastUpdateDate == null) {
      return null;
    }
    final currentDate = _getCurrentDate();

    if (lastUpdateDate == currentDate) {
      return _storage.read<Map<String, dynamic>>(_weatherDataKey);
    }
    return null;
  }

  // Clear the cache
  static Future<void> clearCache() async {
    await _storage.remove(_weatherDataKey);
    await _storage.remove(_lastUpdateDateKey);
  }

  // Get current date in YYYY-MM-DD format
  static String _getCurrentDate() {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }
}
