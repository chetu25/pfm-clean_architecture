import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/domain/repositories/theme_repositories.dart';

part 'theme_event.dart';
part 'theme_state.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepositories _themeRepositories;
  ThemeBloc(this._themeRepositories) : super(LightThemeState()) {
    on<CheckTheme>(loadInitialTheme);
    on<ChangeToLightTheme>(changeToLightTheme);
    on<ChangeToDarkTheme>(changeToDarkTheme);

    add(CheckTheme());
  }

  Future loadInitialTheme(CheckTheme event, Emitter<ThemeState> emit) async {
    final storedTheme = await _themeRepositories.getLocalTheme();
    if (storedTheme == null) {
      final brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      if (brightness == Brightness.dark) {
        emit(DarkThemeState());
      } else {
        emit(LightThemeState());
      }
    } else if (storedTheme == 'dark') {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  Future<void> changeToLightTheme(
      ChangeToLightTheme event, Emitter<ThemeState> emit) async {
    emit(LightThemeState());
    await _themeRepositories.setLocalTheme('light');
  }

  Future<void> changeToDarkTheme(
      ChangeToDarkTheme event, Emitter<ThemeState> emit) async {
    emit(DarkThemeState());
    await _themeRepositories.setLocalTheme('dark');
  }
}
