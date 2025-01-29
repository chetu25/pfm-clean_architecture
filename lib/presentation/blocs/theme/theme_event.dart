part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

final class CheckTheme extends ThemeEvent {
  const CheckTheme();

  @override
  List<Object> get props => [];
}

final class ChangeToLightTheme extends ThemeEvent {
  const ChangeToLightTheme();

  @override
  List<Object> get props => [];
}

final class ChangeToDarkTheme extends ThemeEvent {
  const ChangeToDarkTheme();

  @override
  List<Object> get props => [];
}
