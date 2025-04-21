// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Location updated`
  String get location_updated {
    return Intl.message(
      'Location updated',
      name: 'location_updated',
      desc: '',
      args: [],
    );
  }

  /// `Weather updated to current location`
  String get weather_updated {
    return Intl.message(
      'Weather updated to current location',
      name: 'weather_updated',
      desc: '',
      args: [],
    );
  }

  /// `Location didn't change`
  String get location_didnt_change {
    return Intl.message(
      'Location didn\'t change',
      name: 'location_didnt_change',
      desc: '',
      args: [],
    );
  }

  /// `You are in the same location`
  String get you_are_in_the_same_location {
    return Intl.message(
      'You are in the same location',
      name: 'you_are_in_the_same_location',
      desc: '',
      args: [],
    );
  }

  /// `Hourly Forecast`
  String get hourly_forecast {
    return Intl.message(
      'Hourly Forecast',
      name: 'hourly_forecast',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Days`
  String get upcoming_days {
    return Intl.message(
      'Upcoming Days',
      name: 'upcoming_days',
      desc: '',
      args: [],
    );
  }

  /// `Weather Details`
  String get weather_details {
    return Intl.message(
      'Weather Details',
      name: 'weather_details',
      desc: '',
      args: [],
    );
  }

  /// `Precipitation`
  String get percipitation {
    return Intl.message(
      'Precipitation',
      name: 'percipitation',
      desc: '',
      args: [],
    );
  }

  /// `Wind`
  String get wind {
    return Intl.message('Wind', name: 'wind', desc: '', args: []);
  }

  /// `km/h`
  String get km_per_hour {
    return Intl.message('km/h', name: 'km_per_hour', desc: '', args: []);
  }

  /// `Humidity`
  String get humidity {
    return Intl.message('Humidity', name: 'humidity', desc: '', args: []);
  }

  /// `mm`
  String get mm {
    return Intl.message('mm', name: 'mm', desc: '', args: []);
  }

  /// `UV`
  String get uv {
    return Intl.message('UV', name: 'uv', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Location Permission Denied`
  String get location_permission_denied {
    return Intl.message(
      'Location Permission Denied',
      name: 'location_permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `Location Service Disabled`
  String get location_service_disabled {
    return Intl.message(
      'Location Service Disabled',
      name: 'location_service_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Error Getting Weather`
  String get error_getting_weather {
    return Intl.message(
      'Error Getting Weather',
      name: 'error_getting_weather',
      desc: '',
      args: [],
    );
  }

  /// `Request Location Permission`
  String get request_location_permission {
    return Intl.message(
      'Request Location Permission',
      name: 'request_location_permission',
      desc: '',
      args: [],
    );
  }

  /// `Check Location Service`
  String get check_location_service {
    return Intl.message(
      'Check Location Service',
      name: 'check_location_service',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get try_again {
    return Intl.message('Try Again', name: 'try_again', desc: '', args: []);
  }

  /// `Search City`
  String get search_city {
    return Intl.message('Search City', name: 'search_city', desc: '', args: []);
  }

  /// `Enter City Name`
  String get enter_city_name {
    return Intl.message(
      'Enter City Name',
      name: 'enter_city_name',
      desc: '',
      args: [],
    );
  }

  /// `Searching...`
  String get searching {
    return Intl.message('Searching...', name: 'searching', desc: '', args: []);
  }

  /// `No results found`
  String get no_results_found {
    return Intl.message(
      'No results found',
      name: 'no_results_found',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get tomorrow {
    return Intl.message('Tomorrow', name: 'tomorrow', desc: '', args: []);
  }

  /// `Hour Details`
  String get hour_details {
    return Intl.message(
      'Hour Details',
      name: 'hour_details',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get select_language {
    return Intl.message(
      'Select Language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Sunny`
  String get sunny {
    return Intl.message('Sunny', name: 'sunny', desc: '', args: []);
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Partly Cloudy`
  String get partly_cloudy {
    return Intl.message(
      'Partly Cloudy',
      name: 'partly_cloudy',
      desc: '',
      args: [],
    );
  }

  /// `Cloudy`
  String get cloudy {
    return Intl.message('Cloudy', name: 'cloudy', desc: '', args: []);
  }

  /// `Overcast`
  String get overcast {
    return Intl.message('Overcast', name: 'overcast', desc: '', args: []);
  }

  /// `Mist`
  String get mist {
    return Intl.message('Mist', name: 'mist', desc: '', args: []);
  }

  /// `Patchy rain possible`
  String get patchy_rain_possible {
    return Intl.message(
      'Patchy rain possible',
      name: 'patchy_rain_possible',
      desc: '',
      args: [],
    );
  }

  /// `Patchy snow possible`
  String get patchy_snow_possible {
    return Intl.message(
      'Patchy snow possible',
      name: 'patchy_snow_possible',
      desc: '',
      args: [],
    );
  }

  /// `Patchy sleet possible`
  String get patchy_sleet_possible {
    return Intl.message(
      'Patchy sleet possible',
      name: 'patchy_sleet_possible',
      desc: '',
      args: [],
    );
  }

  /// `Patchy freezing drizzle possible`
  String get patchy_freezing_drizzle_possible {
    return Intl.message(
      'Patchy freezing drizzle possible',
      name: 'patchy_freezing_drizzle_possible',
      desc: '',
      args: [],
    );
  }

  /// `Thundery outbreaks possible`
  String get thundery_outbreaks_possible {
    return Intl.message(
      'Thundery outbreaks possible',
      name: 'thundery_outbreaks_possible',
      desc: '',
      args: [],
    );
  }

  /// `Blowing snow`
  String get blowing_snow {
    return Intl.message(
      'Blowing snow',
      name: 'blowing_snow',
      desc: '',
      args: [],
    );
  }

  /// `Blizzard`
  String get blizzard {
    return Intl.message('Blizzard', name: 'blizzard', desc: '', args: []);
  }

  /// `Fog`
  String get fog {
    return Intl.message('Fog', name: 'fog', desc: '', args: []);
  }

  /// `Freezing fog`
  String get freezing_fog {
    return Intl.message(
      'Freezing fog',
      name: 'freezing_fog',
      desc: '',
      args: [],
    );
  }

  /// `Patchy light drizzle`
  String get patchy_light_drizzle {
    return Intl.message(
      'Patchy light drizzle',
      name: 'patchy_light_drizzle',
      desc: '',
      args: [],
    );
  }

  /// `Light drizzle`
  String get light_drizzle {
    return Intl.message(
      'Light drizzle',
      name: 'light_drizzle',
      desc: '',
      args: [],
    );
  }

  /// `Freezing drizzle`
  String get freezing_drizzle {
    return Intl.message(
      'Freezing drizzle',
      name: 'freezing_drizzle',
      desc: '',
      args: [],
    );
  }

  /// `Heavy freezing drizzle`
  String get heavy_freezing_drizzle {
    return Intl.message(
      'Heavy freezing drizzle',
      name: 'heavy_freezing_drizzle',
      desc: '',
      args: [],
    );
  }

  /// `Patchy light rain`
  String get patchy_light_rain {
    return Intl.message(
      'Patchy light rain',
      name: 'patchy_light_rain',
      desc: '',
      args: [],
    );
  }

  /// `Light rain`
  String get light_rain {
    return Intl.message('Light rain', name: 'light_rain', desc: '', args: []);
  }

  /// `Moderate rain at times`
  String get moderate_rain_at_times {
    return Intl.message(
      'Moderate rain at times',
      name: 'moderate_rain_at_times',
      desc: '',
      args: [],
    );
  }

  /// `Moderate rain`
  String get moderate_rain {
    return Intl.message(
      'Moderate rain',
      name: 'moderate_rain',
      desc: '',
      args: [],
    );
  }

  /// `Heavy rain at times`
  String get heavy_rain_at_times {
    return Intl.message(
      'Heavy rain at times',
      name: 'heavy_rain_at_times',
      desc: '',
      args: [],
    );
  }

  /// `Heavy rain`
  String get heavy_rain {
    return Intl.message('Heavy rain', name: 'heavy_rain', desc: '', args: []);
  }

  /// `Light freezing rain`
  String get light_freezing_rain {
    return Intl.message(
      'Light freezing rain',
      name: 'light_freezing_rain',
      desc: '',
      args: [],
    );
  }

  /// `Moderate or heavy freezing rain`
  String get moderate_or_heavy_freezing_rain {
    return Intl.message(
      'Moderate or heavy freezing rain',
      name: 'moderate_or_heavy_freezing_rain',
      desc: '',
      args: [],
    );
  }

  /// `Light sleet`
  String get light_sleet {
    return Intl.message('Light sleet', name: 'light_sleet', desc: '', args: []);
  }

  /// `Moderate or heavy sleet`
  String get moderate_or_heavy_sleet {
    return Intl.message(
      'Moderate or heavy sleet',
      name: 'moderate_or_heavy_sleet',
      desc: '',
      args: [],
    );
  }

  /// `Patchy light snow`
  String get patchy_light_snow {
    return Intl.message(
      'Patchy light snow',
      name: 'patchy_light_snow',
      desc: '',
      args: [],
    );
  }

  /// `Light snow`
  String get light_snow {
    return Intl.message('Light snow', name: 'light_snow', desc: '', args: []);
  }

  /// `Patchy moderate snow`
  String get patchy_moderate_snow {
    return Intl.message(
      'Patchy moderate snow',
      name: 'patchy_moderate_snow',
      desc: '',
      args: [],
    );
  }

  /// `Moderate snow`
  String get moderate_snow {
    return Intl.message(
      'Moderate snow',
      name: 'moderate_snow',
      desc: '',
      args: [],
    );
  }

  /// `Patchy heavy snow`
  String get patchy_heavy_snow {
    return Intl.message(
      'Patchy heavy snow',
      name: 'patchy_heavy_snow',
      desc: '',
      args: [],
    );
  }

  /// `Heavy snow`
  String get heavy_snow {
    return Intl.message('Heavy snow', name: 'heavy_snow', desc: '', args: []);
  }

  /// `Ice pellets`
  String get ice_pellets {
    return Intl.message('Ice pellets', name: 'ice_pellets', desc: '', args: []);
  }

  /// `Light rain shower`
  String get light_rain_shower {
    return Intl.message(
      'Light rain shower',
      name: 'light_rain_shower',
      desc: '',
      args: [],
    );
  }

  /// `Moderate or heavy rain shower`
  String get moderate_or_heavy_rain_shower {
    return Intl.message(
      'Moderate or heavy rain shower',
      name: 'moderate_or_heavy_rain_shower',
      desc: '',
      args: [],
    );
  }

  /// `Torrential rain shower`
  String get torrential_rain_shower {
    return Intl.message(
      'Torrential rain shower',
      name: 'torrential_rain_shower',
      desc: '',
      args: [],
    );
  }

  /// `Light sleet showers`
  String get light_sleet_showers {
    return Intl.message(
      'Light sleet showers',
      name: 'light_sleet_showers',
      desc: '',
      args: [],
    );
  }

  /// `Moderate or heavy sleet showers`
  String get moderate_or_heavy_sleet_showers {
    return Intl.message(
      'Moderate or heavy sleet showers',
      name: 'moderate_or_heavy_sleet_showers',
      desc: '',
      args: [],
    );
  }

  /// `Light snow showers`
  String get light_snow_showers {
    return Intl.message(
      'Light snow showers',
      name: 'light_snow_showers',
      desc: '',
      args: [],
    );
  }

  /// `Moderate or heavy snow showers`
  String get moderate_or_heavy_snow_showers {
    return Intl.message(
      'Moderate or heavy snow showers',
      name: 'moderate_or_heavy_snow_showers',
      desc: '',
      args: [],
    );
  }

  /// `Light showers of ice pellets`
  String get light_showers_of_ice_pellets {
    return Intl.message(
      'Light showers of ice pellets',
      name: 'light_showers_of_ice_pellets',
      desc: '',
      args: [],
    );
  }

  /// `Moderate or heavy showers of ice pellets`
  String get moderate_or_heavy_showers_of_ice_pellets {
    return Intl.message(
      'Moderate or heavy showers of ice pellets',
      name: 'moderate_or_heavy_showers_of_ice_pellets',
      desc: '',
      args: [],
    );
  }

  /// `Patchy light rain with thunder`
  String get patchy_light_rain_with_thunder {
    return Intl.message(
      'Patchy light rain with thunder',
      name: 'patchy_light_rain_with_thunder',
      desc: '',
      args: [],
    );
  }

  /// `Moderate or heavy rain with thunder`
  String get moderate_or_heavy_rain_with_thunder {
    return Intl.message(
      'Moderate or heavy rain with thunder',
      name: 'moderate_or_heavy_rain_with_thunder',
      desc: '',
      args: [],
    );
  }

  /// `Patchy light snow with thunder`
  String get patchy_light_snow_with_thunder {
    return Intl.message(
      'Patchy light snow with thunder',
      name: 'patchy_light_snow_with_thunder',
      desc: '',
      args: [],
    );
  }

  /// `Moderate or heavy snow with thunder`
  String get moderate_or_heavy_snow_with_thunder {
    return Intl.message(
      'Moderate or heavy snow with thunder',
      name: 'moderate_or_heavy_snow_with_thunder',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
