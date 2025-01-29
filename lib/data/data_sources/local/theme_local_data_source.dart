import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/meta_strings.dart';

abstract class ThemeLocalDataSource {
  Future<void> setTheme(String theme);

  Future<String?> getTheme();
}

@LazySingleton(as: ThemeLocalDataSource)
class ThemeDataLocalSourceImpl implements ThemeLocalDataSource {
  @override
  Future<String?> getTheme() async {
    final tokenBox = await Hive.openBox(HiveBoxStrings.tokenBox);
    return tokenBox.get(HiveBoxStrings.themeBox);
  }

  @override
  Future<void> setTheme(String theme) async {
    final tokenBox = await Hive.openBox(HiveBoxStrings.tokenBox);
    tokenBox.put(HiveBoxStrings.themeBox, theme);
  }
}
