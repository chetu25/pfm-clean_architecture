import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:pfm_ekyc/core/common/app_error.dart';
import 'package:pfm_ekyc/data/models/authentication/get_email_otp_model.dart';
import 'package:pfm_ekyc/domain/entities/get_email_otp_params.dart';
import 'package:pfm_ekyc/domain/usecases/authentication/send_email_otp.dart';

part 'get_email_otp_event.dart';
part 'get_email_otp_state.dart';

@injectable
class GetEmailOtpBloc extends Bloc<GetEmailOtpEvent, GetEmailOtpState> {
  final SendEmailOtp sendEmailOtp;
  GetEmailOtpBloc(this.sendEmailOtp) : super(GetEmailOtpInitial()) {
    on<Emailotp>(requestEmailOtp);
    // on<GoogleSign>(googlelLogin);
    on<StateChange>(changeToInitailState);
  }

  Future<void> requestEmailOtp(
      Emailotp event, Emitter<GetEmailOtpState> emit) async {
    emit(GetEmailOtpLoading());

    final response = await sendEmailOtp(event.param);

    response.fold((l) {
      emit(
        GetEmailOtpFailure(errorType: l.errorType, errorMessage: l.error),
      );
    }, (r) {
      emit(GetEmailOtpSuccess(r));
    });
  }

  void changeToInitailState(StateChange event, Emitter<GetEmailOtpState> emit) {
    emit(GetEmailOtpInitial());
  }

  // final _signInWithGoogle = GoogleSignIn(scopes: ['email']);
  // Future googlelLogin(GoogleSign event, Emitter<GetEmailOtpState> emit) async {
  //   emit(LoginWithGoogleLoading());
  //   try {
  //     final googleUser = await _signInWithGoogle.signIn();
  //     if (googleUser == null) {
  //       emit(GetEmailOtpInitial());
  //     } else {
  //       logInfo(_h, 'Logged in with Google');

  //       final googleAuth = await googleUser.authentication;

  //       final credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );

  //       UserCredential userCredential =
  //           await FirebaseAuth.instance.signInWithCredential(credential);

  //       final User? firebaseUser = userCredential.user;

  //       if (firebaseUser != null) {
  //         logInfo(_h, 'User signed in to Firebase: ${firebaseUser.email}');
  //         emit(LoginWithGoogleSuccess(
  //           googleSignInAccount: googleUser,
  //           accessToken: googleAuth.accessToken!,
  //         ));
  //       } else {
  //         throw Exception('Failed to retrieve Firebase user.');
  //       }
  //     }
  //   } catch (e) {
  //     logErrorObject(_h, e, 'Error logging in with Google');
  //     emit(LoginWithGoogleFailure(error: e.toString()));
  //   }
  // }
}
