import 'package:dsa_teaching_web/core/utils/navigation/routes.dart';
import 'package:dsa_teaching_web/presentation/initial/auth/auth_factory.dart';
import 'package:dsa_teaching_web/presentation/initial/initial_factory.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    return switch (routeSettings.name) {
      AppRoutes.routeAuth => _buildAuth(routeSettings),
      _ => _buildInitial(routeSettings),
    };
  }

  static PageRoute _buildInitial(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => InitialFactory.build(),
    );
  }

  static PageRoute _buildAuth(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => AuthFactory.build(),
    );
  }
}
