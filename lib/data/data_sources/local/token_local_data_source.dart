import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/meta_strings.dart';


abstract class TokenLocalDataSource {
  Future<String?> getToken();

  Future<void> setToken(String accessToken);


  Future<void> clearTokens();
}

@LazySingleton(as: TokenLocalDataSource)
class TokenLocalDataSourceImpl implements TokenLocalDataSource {
  @override
  Future<void> clearTokens() async {
    final tokenBox = await Hive.openBox(HiveBoxStrings.tokenBox);
    tokenBox.clear();
  }

  @override
  Future<String?> getToken() async {
    final tokenBox = await Hive.openBox(HiveBoxStrings.tokenBox);
    return tokenBox.get(HiveBoxStrings.tokenBox);
  }


  @override
  Future<void> setToken(String accessToken) async {
    final tokenBox = await Hive.openBox(HiveBoxStrings.tokenBox);
    tokenBox.put(HiveBoxStrings.tokenBox, accessToken);
  }


}
