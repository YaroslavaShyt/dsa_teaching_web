import 'package:dsa_teaching_web/presentation/initial/bloc/initial_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/initial_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/user/user_service.dart';
import '../../data/services/user/user_state.dart';

class InitialFactory {
  static Widget build() {
    return BlocProvider<InitialCubit>(
      create: (context) => InitialCubit(),
      child: BlocListener<UserService, UserState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (BuildContext context, UserState state) {
          BlocProvider.of<InitialCubit>(context)
              .onUserStateChanged(state.status);
        },
        child: Builder(
          builder: (BuildContext context) {
            return InitialScreen(
              cubit: BlocProvider.of<InitialCubit>(context),
            );
          },
        ),
      ),
    );
  }
}
