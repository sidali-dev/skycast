import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../data/models/weather/weather.dart';

class WeatherService {
  final String _baseUrl = 'https://api.weatherapi.com/v1/forecast.json';
  final Dio _dio = Dio();

  Future<Weather> getForecast(String lat, String lon) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'key': dotenv.get('WEATHER_API_KEY'),
          'q': '$lat,$lon',
          'days': 3,
        },
      );

      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }
}
