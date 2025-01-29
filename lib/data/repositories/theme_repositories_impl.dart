import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/data/data_sources/local/theme_local_data_source.dart';
import 'package:pfm_ekyc/domain/repositories/theme_repositories.dart';

@LazySingleton(as: ThemeRepositories)
class ThemeRepositoriesImpl implements ThemeRepositories {
  final ThemeLocalDataSource _themeDataLocalSource;

  ThemeRepositoriesImpl(this._themeDataLocalSource);

  @override
  Future<String?> getLocalTheme() async => _themeDataLocalSource.getTheme();

  @override
  Future<void> setLocalTheme(String theme) async =>
      await _themeDataLocalSource.setTheme(theme);
}
