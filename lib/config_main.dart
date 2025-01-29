import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pfm_ekyc/core/common/logger.dart';
import 'package:pfm_ekyc/di/get_it.dart';
import 'package:pfm_ekyc/presentation/blocs/bloc_observer.dart';

Future<void> configMain() async {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Logger().setLogLevel(LogLevel.debugFinest);
  Logger().setShowInReleaseMode(false);
  await Hive.initFlutter('data');

  ///This is UI error handling, it will open new screen with error details
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   runApp(
  //     UIErrorWidgetClass(
  //       details: details,
  //     ),
  //   );
  // };
}
