import 'package:dsa_teaching_web/presentation/initial/bloc/initial_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/services/user/user_state.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit() : super(const InitialState());

  Future<void> onUserStateChanged(UserStatus status) async {
    return switch (status) {
      UserStatus.initialized =>
        emit(state.copyWith(status: InitialStatus.main)),
      UserStatus.notInitialized =>
        emit(state.copyWith(status: InitialStatus.auth)),
      UserStatus.undefined =>
        emit(state.copyWith(status: InitialStatus.loading)),
    };
  }
}
