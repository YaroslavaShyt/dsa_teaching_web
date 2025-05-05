import 'package:dsa_teaching_web/domain/services/user/iuser_service.dart';
import 'package:dsa_teaching_web/presentation/initial/bloc/initial_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/services/user/user_state.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit({
    required IUserService userService,
  })  : _userService = userService,
        super(const InitialState());

  final IUserService _userService;

  Future<void> init() async {
    await _userService.init();
    if (_userService.user == null) {
      emit(state.copyWith(status: InitialStatus.auth));
    } else {
      emit(state.copyWith(status: InitialStatus.main));
    }
  }

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
