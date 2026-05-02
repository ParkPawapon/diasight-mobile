import 'package:diasight_app/core/config/flavors/app_flavor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  const AppEnvironment({
    required this.flavor,
    required this.appName,
    required this.apiBaseUrl,
    required this.apiTimeout,
    required this.sslPinningEnabled,
    required this.certificatePinSha256,
  });

  final AppFlavor flavor;
  final String appName;
  final Uri apiBaseUrl;
  final Duration apiTimeout;
  final bool sslPinningEnabled;
  final String? certificatePinSha256;

  static Future<AppEnvironment> load(AppFlavor flavor) async {
    try {
      await dotenv.load(fileName: flavor.envFileName);
    } on Object {
      await dotenv.load(fileName: 'assets/env/.env.example');
    }

    return AppEnvironment(
      flavor: flavor,
      appName: dotenv.maybeGet('APP_NAME') ?? 'Diasight',
      apiBaseUrl: Uri.parse(
        dotenv.maybeGet('API_BASE_URL') ?? 'https://api.example.invalid',
      ),
      apiTimeout: Duration(
        milliseconds:
            int.tryParse(
              dotenv.maybeGet('API_TIMEOUT_MS') ?? '',
            ) ??
            30000,
      ),
      sslPinningEnabled:
          (dotenv.maybeGet('SSL_PINNING_ENABLED') ?? 'false').toLowerCase() ==
          'true',
      certificatePinSha256: _blankToNull(
        dotenv.maybeGet('CERTIFICATE_PIN_SHA256'),
      ),
    );
  }

  static String? _blankToNull(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    return value.trim();
  }
}
