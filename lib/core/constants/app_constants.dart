class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;

  // Storage Keys
  static const String themePreferenceKey = 'theme_preference';
  static const String languagePreferenceKey = 'language_preference';
  static const String userDataKey = 'user_data';

  // App Configuration
  static const String appName = 'Flutter BLoC App';
  static const String appVersion = '1.0.0';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Validation
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 20;

  // Animation durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration splashDuration = Duration(seconds: 2);
}
