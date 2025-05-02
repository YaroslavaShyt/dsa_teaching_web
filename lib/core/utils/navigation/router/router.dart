import 'package:dsa_teaching_web/core/utils/navigation/routes.dart';
import 'package:dsa_teaching_web/presentation/initial/auth/auth_factory.dart';
import 'package:dsa_teaching_web/presentation/initial/initial_factory.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/topic_details_factory.dart';
import 'package:dsa_teaching_web/presentation/initial/users/users_factory.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.contains('topic_details') ?? false) {
      return _buildTopicDetails(routeSettings);
    }
    return switch (routeSettings.name) {
      AppRoutes.routeAuth => _buildAuth(routeSettings),
      AppRoutes.routeUsers => _buildUsers(routeSettings),
      AppRoutes.topicDetails => _buildTopicDetails(routeSettings),
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

  static PageRoute _buildUsers(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => UsersFactory.build(),
    );
  }

  static PageRoute _buildTopicDetails(RouteSettings settings) {
    final Uri uri = Uri.parse(settings.name ?? '');
    String categoryName = '';
    String topicName = '';

    if (uri.pathSegments.length == 3 &&
        uri.pathSegments[0] == 'topic_details') {
      categoryName = uri.pathSegments[1];
      topicName = uri.pathSegments[2];
    }
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => TopicDetailsFactory.build(
        TopicDetailsRoutingArgs(
          categoryName: categoryName,
          topicName: topicName,
        ),
      ),
    );
  }
}
