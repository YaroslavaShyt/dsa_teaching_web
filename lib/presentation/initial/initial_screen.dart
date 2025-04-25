import 'package:dsa_teaching_web/presentation/initial/auth/auth_factory.dart';
import 'package:dsa_teaching_web/presentation/initial/bloc/initial_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/bloc/initial_state.dart';
import 'package:dsa_teaching_web/presentation/initial/home/home_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({
    required this.cubit,
    super.key,
  });

  final InitialCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialCubit, InitialState>(
      builder: (context, state) {
        return switch (state.status) {
          InitialStatus.auth => AuthFactory.build(),
          InitialStatus.main => HomeFactory.build(),
          InitialStatus.loading => AuthFactory.build(),
        };
      },
    );
  }
}
