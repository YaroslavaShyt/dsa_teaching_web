class AppRoutes {
  static String topicDetails(String categoryName, String topicName) =>
      'topic_details/$categoryName/$topicName';

  static const String routeInitial = 'initial';
  static const String routeAuth = 'auth';
  static const String routeUsers = 'users';
}
