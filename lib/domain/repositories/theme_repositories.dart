abstract class ThemeRepositories {
  Future<String?> getLocalTheme();

  Future<void> setLocalTheme(String theme);
}
