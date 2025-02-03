import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pfm_ekyc/core/common/app_keys.dart';
import 'package:pfm_ekyc/core/common/logger.dart';
import 'package:pfm_ekyc/domain/repositories/tokens_repositories.dart';
import 'package:pfm_ekyc/routes/route.dart';

const String _h = 'token_service';

@lazySingleton
class TokenService {
  final TokenRepository _tokenRepository;

  TokenService(this._tokenRepository);

  Future<String> getToken() async {
    final String? accessToken = await _tokenRepository.getToken();
    if (accessToken == null) {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        Routes.onboarding,
        (route) => false,
      );
      throw Exception();
    } else if (JwtDecoder.isExpired(accessToken)) {
      logFatal(_h, null, 'Access token is expired');
      navigatorKey.currentContext!.pushReplacementNamed(Routes.onboarding);
      throw Exception();
    } else {
      logDebugFine(_h, accessToken);
      return accessToken;
    }
  }
}
