import 'package:dsa_teaching_web/data/services/auth/auth_service.dart';
import 'package:dsa_teaching_web/presentation/initial/auth/auth_screen.dart';
import 'package:dsa_teaching_web/presentation/initial/auth/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthFactory {
  static Widget build() {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(
        authService: BlocProvider.of<AuthService>(context),
      ),
      child: Builder(
        builder: (context) {
          return AuthScreen(
            cubit: BlocProvider.of<AuthCubit>(context),
          );
        },
      ),
    );
  }
}
