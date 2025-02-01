import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pfm_ekyc/core/common/app_keys.dart';
import 'package:pfm_ekyc/di/get_it.dart';
import 'package:pfm_ekyc/presentation/blocs/account_aggregator/fetch_consent_status/fetch_consent_status_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/account_aggregator/fetch_seesion_status/get_session_status_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/account_aggregator/get_consent_url/get_consent_url_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/get_email_otp/get_email_otp_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/get_phone_otp/getphoneotp_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/get_profile/get_profile_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/update_pan/update_pan_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/validate_pan/validate_pan_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/verify_email_otp/verify_email_otp_bloc.dart';
import 'package:pfm_ekyc/presentation/blocs/authenticate/verify_phone_otp/verify_phone_otp_bloc.dart';
import 'package:pfm_ekyc/presentation/screens/account_aggregator/account_aggregator.dart';
import 'package:pfm_ekyc/presentation/screens/account_aggregator/congratulations_screen.dart';
import 'package:pfm_ekyc/presentation/screens/account_aggregator/setu_web_view_screen.dart';
import 'package:pfm_ekyc/presentation/screens/login/login_with_email_screen.dart';
import 'package:pfm_ekyc/presentation/screens/login/login_with_phone_screen.dart';
import 'package:pfm_ekyc/presentation/screens/login/verify_pan_screen.dart';
import 'package:pfm_ekyc/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:pfm_ekyc/presentation/screens/splash_screen.dart';
import 'package:pfm_ekyc/routes/route.dart';

class RouteGenerator {
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.inital,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.inital,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: Routes.phoneLogin,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<VerifyPhoneOtpBloc>(),
              ),
              BlocProvider(
                create: (context) => getIt<GetphoneotpBloc>(),
              ),
            ],
            child: LoginWithPhoneScreen(),
          );
        },
      ),
      GoRoute(
          path: Routes.emailLogin,
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<GetEmailOtpBloc>(),
                ),
                BlocProvider(
                  create: (context) => getIt<VerifyEmailOtpBloc>(),
                ),
              ],
              child: const LoginWithEmailScreen(),
            );
          }),
      GoRoute(
        path: Routes.panVerification,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ValidatePanBloc>(),
              ),
              BlocProvider(
                create: (context) => getIt<UpdatePanBloc>(),
              ),
            ],
            child: VerifyPanScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.accountAggregator,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                getIt<GetProfileBloc>()..add(FetchProfileEvent()),
            child: const AccountAggregator(),
          );
        },
      ),
      GoRoute(
        path: Routes.setuWeb,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<GetConsentUrlBloc>()..add(GetConsentLinkEvent()),
              ),
              BlocProvider(
                create: (context) => getIt<FetchConsentStatusBloc>(),
              ),
              BlocProvider(
                create: (context) => getIt<GetSessionStatusBloc>(),
              ),
            ],
            child: const SetuWebViewScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.congratulationsScreen,
        builder: (context, state) {
          return const CongratulationsScreen();
        },
      ),
    ],
  );
}
