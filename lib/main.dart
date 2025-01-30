import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfm_ekyc/config_main.dart';
import 'package:pfm_ekyc/core/ColorPallete/colors.dart';
import 'package:pfm_ekyc/di/get_it.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/get_stage/get_stage_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/connectivity/connectivity_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/theme/theme_bloc.dart';
import 'package:pfm_ekyc/routes/route_generator.dart';

void main() async {
  await configMain();
  runApp(const PFMekyc());
}

class PFMekyc extends StatelessWidget {
  const PFMekyc({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeBloc>()),
        BlocProvider(create: (context) => getIt<ConnectivityBloc>()),
        BlocProvider(create: (context) => getIt<GetStageBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Rise Pro',
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return Container(child: child);
            },
            routerConfig: RouteGenerator.router,
            theme: AppTheme.lightTheme(context),
            darkTheme: AppTheme.darkTheme(context),
            themeMode:
                state is DarkThemeState ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
