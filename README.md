# Weather App

A modern weather application built with Flutter and GetX for state management, routing, and dependency injection.

## Screenshots

<div align="center">
  <img src="assets/screenshots/Preview.png" width="200" alt="Home Screen"/>
  <img src="assets/screenshots/Preview-1.png" width="200" alt="Home Screen"/>
  <img src="assets/screenshots/Preview-2.png" width="200" alt="Weather Details"/>
  <img src="assets/screenshots/Preview-3.png" width="200" alt="Search Screen"/>
  <img src="assets/screenshots/Preview-4.png" width="200" alt="Settings"/>
  <img src="assets/screenshots/Preview-5.png" width="200" alt="Dark Theme"/>
  <img src="assets/screenshots/Preview-6.png" width="200" alt="Light Theme"/>
</div>

## Features

- Real-time weather information
- Location-based weather
- Hour specific weather details
- City search functionality
- Dark/Light theme support
- Modern UI with animations
- Supports 3 languages (English, Francais, العربية)
- Error handling

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Create a `.env` file in the root directory and add your weatherapi API key from https://www.weatherapi.com/:
   ```
   WEATHER_API_KEY=your_api_key_here
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- get: ^4.6.6 - State management, routing, and dependency injection
- geolocator: ^10.1.0 - Location services
- intl: ^0.19.0 - Date formatting
- flutter_dotenv: ^5.1.0 - Environment variables
- dio: ^5.8.0+1 - HTTP client
- flutter_localizations: SDK - Internationalization support
- get_storage: ^2.1.1 - Local storage
- flutter_lints: ^5.0.0 - Code linting

## Project Structure

```
lib/
├── app/
│   ├── controllers/ - Business logic and state management
│   ├── data/ - Data models and repositories
│   ├── helpers/ - Helper functions and utilities
│   ├── routes/ - Navigation and routing configuration
│   ├── services/ - API and external service integrations
│   ├── theme/ - App theming and styling
│   ├── utils/ - Utility functions and constants
│   └── views/ - UI components and screens
├── generated/ - Generated localization files
├── l10n/ - Localization configuration
├── main.dart - Application entry point
└── my_app.dart - Root widget configuration
```

## Getting an API Key

1. Go to [WeatherApi](https://www.weatherapi.com/)
2. Sign up for a free account
3. Get your API key from the dashboard
4. Add it to the `.env` file

## License

MIT License
