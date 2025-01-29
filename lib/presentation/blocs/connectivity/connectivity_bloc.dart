import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

@injectable
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  ConnectivityBloc(this._connectivity) : super(ConnectivityInitial()) {
    on<CheckConnectivity>(monitorConnectivity);
  }

  Future<void> monitorConnectivity(
      CheckConnectivity event, Emitter<ConnectivityState> emit) async {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        final result =
            results.isNotEmpty ? results[0] : ConnectivityResult.none;

        if (result == ConnectivityResult.none) {
          emit(DisconnectedState());
        } else {
          emit(ConnectedState());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
