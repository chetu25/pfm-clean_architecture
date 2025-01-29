import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/profile_model.dart';
import 'package:pfm_ekyc/domain/entities/no_params.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/get_profile_data.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';

@injectable
class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {
  final GetProfileData getProfileData;
  GetProfileBloc(this.getProfileData) : super(GetProfileInitial()) {
    on<FetchProfileEvent>(profileData);
  }

  Future profileData(
      FetchProfileEvent event, Emitter<GetProfileState> emit) async {
    emit(GetProfileLoading());
    final result = await getProfileData(NoParams());
    result.fold(
      (l) => emit(
        GetProfileError(errorType: l.errorType, errorMessage: l.error),
      ),
      (r) => emit(
        GetProfileLoaded(r),
      ),
    );
  }
}
