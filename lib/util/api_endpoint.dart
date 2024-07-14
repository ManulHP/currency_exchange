class ApiEndpoint {
  static const String baseUrl = 'https://v6.exchangerate-api.com/v6';
  static const String apiKey = String.fromEnvironment("API_KEY");
  static const String exchangeRate = '/$apiKey/pair';
}