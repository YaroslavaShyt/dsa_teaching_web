class AppRoutes {
  static String topicDetails(String categoryName, String topicName) =>
      'topic_details/$categoryName/$topicName';

  static const String routeInitial = 'initial';
  static const String routeAuth = 'auth';
  static const String routeProfile = 'profile';
  static const String routeHome = 'home';
  static const String routeLearn = 'learn';
  static const String routeMain = 'main';

  static const String routeLesson = 'lesson';
  static const String routeLessonFinished = 'lessonFinished';
}
