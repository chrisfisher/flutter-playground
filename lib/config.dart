class AppConfig {
  static String _apiBaseUrl;

  static void initWithConfig({apiBaseUrl}) {
    _apiBaseUrl = apiBaseUrl;
  }

  static get apiBaseUrl => _apiBaseUrl;
}
