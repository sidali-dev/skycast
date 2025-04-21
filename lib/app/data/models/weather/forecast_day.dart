import 'astro.dart';
import 'current.dart';
import 'day.dart';

class Forecastday {
  DateTime date;
  int dateEpoch;
  Day day;
  Astro astro;
  List<Current> hour;

  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return Forecastday(
      date: DateTime.parse(json['date']),
      dateEpoch: json['date_epoch'],
      day: Day.fromJson(json['day']),
      astro: Astro.fromJson(json['astro']),
      hour: (json['hour'] as List).map((e) => Current.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'date_epoch': dateEpoch,
      'day': day.toJson(),
      'astro': astro.toJson(),
      'hour': hour.map((e) => e.toJson()).toList(),
    };
  }
}
