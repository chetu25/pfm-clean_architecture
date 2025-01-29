import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfm_ekyc/core/common/logger.dart';

const _h = 'bloc_observer';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logSuccess(_h, 'Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logSuccess(_h,
        'onChange -- ${bloc.runtimeType} from State ${change.currentState.runtimeType} to State ${change.nextState.runtimeType}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logSuccess(_h, 'onClose -- ${bloc.runtimeType}');
  }
}
