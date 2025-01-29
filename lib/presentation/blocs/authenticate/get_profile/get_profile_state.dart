part of 'get_profile_bloc.dart';

abstract class GetProfileState extends Equatable {
  const GetProfileState();
}

class GetProfileInitial extends GetProfileState {
  @override
  List<Object> get props => [];
}

class GetProfileLoading extends GetProfileState {
  @override
  List<Object> get props => [];
}

class GetProfileLoaded extends GetProfileState {
  final ProfileModel profileModel;
  const GetProfileLoaded(this.profileModel);
  @override
  List<Object> get props => [profileModel];
}

class GetProfileError extends GetProfileState {
  final AppErrorType errorType;
  final String? errorMessage;
  const GetProfileError({required this.errorType, this.errorMessage});
  @override
  List<Object?> get props => [errorType, errorMessage];
}
