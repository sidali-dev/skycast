# Weather App

A modern weather application built with Flutter and GetX for state management, routing, and dependency injection.

## Features

- Real-time weather information
- Location-based weather
- City search functionality
- Dark/Light theme support
- Modern UI with animations
- Pull-to-refresh
- Error handling

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Create a `.env` file in the root directory and add your OpenWeatherMap API key:
   ```
   WEATHER_API_KEY=your_api_key_here
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- get: ^4.6.6 - State management, routing, and dependency injection
- http: ^1.2.0 - HTTP requests
- geolocator: ^10.1.0 - Location services
- intl: ^0.19.0 - Date formatting
- flutter_dotenv: ^5.1.0 - Environment variables
- google_fonts: ^6.1.0 - Modern typography
- shimmer: ^3.0.0 - Loading animations
- lottie: ^2.7.0 - Weather animations

## Project Structure

```
lib/
├── app/
│   ├── controllers/
│   │   └── weather_controller.dart
│   ├── data/
│   │   ├── models/
│   │   │   └── weather_model.dart
│   │   └── services/
│   │       └── weather_service.dart
│   ├── routes/
│   │   ├── app_pages.dart
│   │   └── app_routes.dart
│   ├── theme/
│   │   └── app_theme.dart
│   └── ui/
│       ├── pages/
│       │   ├── home_page.dart
│       │   ├── search_page.dart
│       │   └── settings_page.dart
│       └── widgets/
│           └── weather_card.dart
└── main.dart
```

## Getting an API Key

1. Go to [OpenWeatherMap](https://openweathermap.org/)
2. Sign up for a free account
3. Get your API key from the dashboard
4. Add it to the `.env` file

## License

MIT License
