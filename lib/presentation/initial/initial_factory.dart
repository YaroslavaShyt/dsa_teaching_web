import 'package:dsa_teaching_web/presentation/initial/bloc/initial_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/initial_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialFactory {
  static Widget build() {
    return BlocProvider<InitialCubit>(
      create: (context) => InitialCubit(),
      child: Builder(
        builder: (BuildContext context) {
          return InitialScreen(
            cubit: BlocProvider.of<InitialCubit>(context),
          );
        },
      ),
    );
  }
}
