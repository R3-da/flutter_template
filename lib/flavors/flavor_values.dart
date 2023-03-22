import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/foundation/extensions/dotenv_ext.dart';

class FlavorValues {
  final String apiBaseUrl;
  final bool useFakeData;
  final bool showLogs;
  final String openWeatherApiKey;
  final bool useGoogleFonts;

  final bool _logSqlStatements;

  const FlavorValues({
    required this.apiBaseUrl,
    required this.openWeatherApiKey,
    logSqlStatements = false,
    this.showLogs = false,
    this.useFakeData = false,
    required this.useGoogleFonts,
  }) : _logSqlStatements = showLogs && logSqlStatements;

  bool get logSqlStatements => _logSqlStatements;

  static FlavorValues fromEnvironment() {
    return FlavorValues(
      apiBaseUrl: dotenv.get("OPEN_WEATHER_BASE_URL"),
      openWeatherApiKey: dotenv.get("OPEN_WEATHER_API_KEY"),
      useGoogleFonts: dotenv.getBoolOrDefault("USE_GOOGLE_FONTS", fallback: true)
    );
  }
}
