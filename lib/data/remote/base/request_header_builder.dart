import 'package:demo_notification/data/local/index.dart';
import 'package:demo_notification/data/remote/api/index.dart';
import 'package:logger/logger.dart';

class RequestHeaderBuilder {
  final TokenCache tokenCache;
  final ApiConfig apiConfig;

  RequestHeaderBuilder(
    this.tokenCache,
    this.apiConfig,
  );

  Map<String, String> _defaultHeader({
    String? token,
    String? languageCode,
    String contentType = 'application/json',
  }) {
    Logger().d("token: $token");
    var header = {
      'content-type': contentType,
    };
    if (token?.isNotEmpty ?? false) {
      header['Authorization'] = 'Bearer $token';
    }
    if (languageCode?.isNotEmpty ?? false) {
      header['Accept-Language'] = '$languageCode';
    }

    return header;
  }

  Future<Map<String, String>> buildHeader() async {
    String accessToken = (await tokenCache.getCachedToken())?.token ?? '';

    var header = _defaultHeader(
      token: accessToken,
    );
    return header;
  }
}
