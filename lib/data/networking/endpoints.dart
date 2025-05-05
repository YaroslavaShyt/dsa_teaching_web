const String _endpoint = String.fromEnvironment('url');

class Endpoints {
  static const String baseEndpoint = 'http://$_endpoint/api/';

  /// AUTH
  static const String _auth = 'auth';
  static const String signInEndpoint = '$_auth/signin/admin';
  static const String signUpEndpoint = '$_auth/signup/admin';

  /// USER
  static const String userEndpoint = 'users/admin';
  static const String allUsersEndpoint = 'users/all';

  /// STATISTICS
  static const String _statistics = 'statistics';

  static String statisticsEndpoint(int id) => '$_statistics/teaching/$id';

  /// LESSON
  static const String _lessonEndpoint = 'lessons';
  static const String getLessonSummaryEndpoint = '$_lessonEndpoint/summary';
  static const String getTopicsSummaryEndpoint = '$_lessonEndpoint/topics';

  static String getLessonTheory(int id) => '$_lessonEndpoint/$id/details';

  static String getLessonGame(int id) => '$_lessonEndpoint/$id/game';

  /// TEACHING
  static const String _teachingEndpoint = 'teaching';
  static const String addLessonEndpoint = '$_teachingEndpoint/';

  static String updateLessonEndpoint(String id) => '$_teachingEndpoint/$id';

  static String deleteLessonEndpoint(String id) => '$_teachingEndpoint/$id';
  static const String addTopicEndpoint = '$_teachingEndpoint/topic';

  static String updateTopicEndpoint(String id) => '$addTopicEndpoint/$id';

  static String deleteTopicEndpoint(String id) => '$addTopicEndpoint/$id';
}
