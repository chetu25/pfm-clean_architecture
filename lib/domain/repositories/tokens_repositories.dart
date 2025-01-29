abstract class TokenRepository {
  Future<String?> getToken();

  Future<void> setToken(String token);

  Future<void> clearTokens();
}
