// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_auth/local_auth.dart' as _i152;

import '../api/api_client.dart' as _i277;
import '../api/injection_module.dart' as _i24;
import '../api/token_services.dart' as _i884;
import '../data/data_sources/local/theme_local_data_source.dart' as _i187;
import '../data/data_sources/local/token_local_data_source.dart' as _i1017;
import '../data/data_sources/remote/account_remote_data_source.dart' as _i459;
import '../data/repositories/account_repositories_impl.dart' as _i529;
import '../data/repositories/theme_repositories_impl.dart' as _i535;
import '../data/repositories/token_repository_impl.dart' as _i393;
import '../domain/repositories/account_repositories.dart' as _i239;
import '../domain/repositories/theme_repositories.dart' as _i490;
import '../domain/repositories/tokens_repositories.dart' as _i629;
import '../domain/usecases/authentication/check_stages.dart' as _i674;
import '../domain/usecases/authentication/get_consent_link.dart' as _i447;
import '../domain/usecases/authentication/get_phone_otp.dart' as _i511;
import '../domain/usecases/authentication/get_profile_data.dart' as _i661;
import '../domain/usecases/authentication/send_email_otp.dart' as _i330;
import '../domain/usecases/authentication/submit_pan.dart' as _i839;
import '../domain/usecases/authentication/validate_pan_number.dart' as _i413;
import '../domain/usecases/authentication/validate_phone_otp.dart' as _i694;
import '../domain/usecases/authentication/vallidate_email_otp.dart' as _i724;
import '../presentation/blocs/authenticate/get_consent_url/get_consent_url_bloc.dart'
    as _i883;
import '../presentation/blocs/authenticate/get_email_otp/get_email_otp_bloc.dart'
    as _i112;
import '../presentation/blocs/authenticate/get_phone_otp/getphoneotp_bloc.dart'
    as _i907;
import '../presentation/blocs/authenticate/get_profile/get_profile_bloc.dart'
    as _i515;
import '../presentation/blocs/authenticate/get_stage/get_stage_bloc.dart'
    as _i610;
import '../presentation/blocs/authenticate/update_pan/update_pan_bloc.dart'
    as _i937;
import '../presentation/blocs/authenticate/validate_pan/validate_pan_bloc.dart'
    as _i464;
import '../presentation/blocs/authenticate/verify_email_otp/verify_email_otp_bloc.dart'
    as _i389;
import '../presentation/blocs/authenticate/verify_phone_otp/verify_phone_otp_bloc.dart'
    as _i255;
import '../presentation/blocs/connectivity/connectivity_bloc.dart' as _i569;
import '../presentation/blocs/theme/theme_bloc.dart' as _i6;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  gh.lazySingleton<_i152.LocalAuthentication>(() => injectionModule.localAuth);
  gh.lazySingleton<_i895.Connectivity>(() => injectionModule.connectivity());
  gh.lazySingleton<_i187.ThemeLocalDataSource>(
      () => _i187.ThemeDataLocalSourceImpl());
  gh.lazySingleton<_i490.ThemeRepositories>(
      () => _i535.ThemeRepositoriesImpl(gh<_i187.ThemeLocalDataSource>()));
  gh.factory<String>(
    () => injectionModule.baseUrl,
    instanceName: 'baseUrl',
  );
  gh.lazySingleton<_i1017.TokenLocalDataSource>(
      () => _i1017.TokenLocalDataSourceImpl());
  gh.lazySingleton<_i361.Dio>(
      () => injectionModule.dio(gh<String>(instanceName: 'baseUrl')));
  gh.factory<_i6.ThemeBloc>(() => _i6.ThemeBloc(gh<_i490.ThemeRepositories>()));
  gh.factory<_i569.ConnectivityBloc>(
      () => _i569.ConnectivityBloc(gh<_i895.Connectivity>()));
  gh.lazySingleton<_i629.TokenRepository>(
      () => _i393.TokenRepositoryimpl(gh<_i1017.TokenLocalDataSource>()));
  gh.lazySingleton<_i884.TokenService>(
      () => _i884.TokenService(gh<_i629.TokenRepository>()));
  gh.lazySingleton<_i277.ApiClient>(() => _i277.ApiClient(
        gh<_i361.Dio>(),
        gh<_i884.TokenService>(),
      ));
  gh.lazySingleton<_i459.AccountRemoteDataSource>(
      () => _i459.AccountRemoteDataSourceImpl(gh<_i277.ApiClient>()));
  gh.lazySingleton<_i239.AccountRepositories>(
      () => _i529.AccountRepositoriesImpl(gh<_i459.AccountRemoteDataSource>()));
  gh.factory<_i511.GetPhoneOtp>(
      () => _i511.GetPhoneOtp(gh<_i239.AccountRepositories>()));
  gh.factory<_i839.SubmitPan>(
      () => _i839.SubmitPan(gh<_i239.AccountRepositories>()));
  gh.factory<_i694.ValidatePhoneOtp>(
      () => _i694.ValidatePhoneOtp(gh<_i239.AccountRepositories>()));
  gh.factory<_i447.GetConsentLink>(
      () => _i447.GetConsentLink(gh<_i239.AccountRepositories>()));
  gh.factory<_i674.CheckStages>(
      () => _i674.CheckStages(gh<_i239.AccountRepositories>()));
  gh.factory<_i413.ValidatePanNumber>(
      () => _i413.ValidatePanNumber(gh<_i239.AccountRepositories>()));
  gh.factory<_i724.VallidateEmailOtp>(
      () => _i724.VallidateEmailOtp(gh<_i239.AccountRepositories>()));
  gh.factory<_i330.SendEmailOtp>(
      () => _i330.SendEmailOtp(gh<_i239.AccountRepositories>()));
  gh.factory<_i661.GetProfileData>(
      () => _i661.GetProfileData(gh<_i239.AccountRepositories>()));
  gh.factory<_i515.GetProfileBloc>(
      () => _i515.GetProfileBloc(gh<_i661.GetProfileData>()));
  gh.factory<_i389.VerifyEmailOtpBloc>(
      () => _i389.VerifyEmailOtpBloc(gh<_i724.VallidateEmailOtp>()));
  gh.factory<_i610.GetStageBloc>(
      () => _i610.GetStageBloc(gh<_i674.CheckStages>()));
  gh.factory<_i464.ValidatePanBloc>(
      () => _i464.ValidatePanBloc(gh<_i413.ValidatePanNumber>()));
  gh.factory<_i883.GetConsentUrlBloc>(
      () => _i883.GetConsentUrlBloc(gh<_i447.GetConsentLink>()));
  gh.factory<_i255.VerifyPhoneOtpBloc>(() => _i255.VerifyPhoneOtpBloc(
        gh<_i694.ValidatePhoneOtp>(),
        gh<_i1017.TokenLocalDataSource>(),
      ));
  gh.factory<_i907.GetphoneotpBloc>(
      () => _i907.GetphoneotpBloc(gh<_i511.GetPhoneOtp>()));
  gh.factory<_i112.GetEmailOtpBloc>(
      () => _i112.GetEmailOtpBloc(gh<_i330.SendEmailOtp>()));
  gh.factory<_i937.UpdatePanBloc>(
      () => _i937.UpdatePanBloc(gh<_i839.SubmitPan>()));
  return getIt;
}

class _$InjectionModule extends _i24.InjectionModule {}
