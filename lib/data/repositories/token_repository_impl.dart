import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/data/data_sources/local/token_local_data_source.dart';
import 'package:pfm_ekyc/domain/repositories/tokens_repositories.dart';

@LazySingleton(as: TokenRepository)
class TokenRepositoryimpl implements TokenRepository {
  final TokenLocalDataSource _tokenLocalDataSource;

  TokenRepositoryimpl(this._tokenLocalDataSource);

  @override
  Future<void> clearTokens() async => await _tokenLocalDataSource.clearTokens();

  @override
  Future<String?> getToken() async => await _tokenLocalDataSource.getToken();

  @override
  Future<void> setToken(String token) async =>
      await _tokenLocalDataSource.setToken(token);
}
