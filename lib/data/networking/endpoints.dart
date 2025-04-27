const String _endpoint = String.fromEnvironment('url');

class Endpoints {
  /// ipconfig from windows
  static const String baseEndpoint = 'http://$_endpoint/api/';

  /// AUTH
  static const String _auth = 'auth';
  static const String signInEndpoint = '$_auth/signin';
  static const String signUpEndpoint = '$_auth/signup';

  /// USER
  static const String userEndpoint = 'users';

  /// ACHIEVEMENTS
  static const String _achievements = 'achievements';
  static const String getAllAchievementsEndpoint = '$_achievements/';
  static String userAchievementsEndpoint = '$_achievements/user/';
  static const String addNewAchievementEndpoint = '$_achievements/user/add';

  /// STREAK
  static const String _streak = 'streak';
  static String userStreakEndpoint = "$_streak/";
  static String updateUserStreakEndpoint = '$_streak/update';

  /// REWARDS
  static const String _rewards = 'rewards';
  static const String rewardsEndpoint = '$_rewards/update';

  /// STATISTICS
  static const String _statistics = 'statistics';
  static const String statisticsEndpoint = '$_statistics/';

  /// LESSON
  static const String _lessonEndpoint = 'lessons';
  static const String getLessonSummaryEndpoint = '$_lessonEndpoint/summary';

  static String getLessonTheory(int id) => '$_lessonEndpoint/$id/details';

  static String getLessonGame(int id) => '$_lessonEndpoint/$id/game';

  static const String _trainings = 'trainings';
  static const String getLearnedLessonsEndpoint = '$_trainings/user';
  static const String finishLessonEndpoint = '$_trainings/complete';

  /// TEACHING
  static const String _teachingEndpoint = 'teaching';
  static const String addLessonEndpoint = '$_teachingEndpoint/';
  static String updateLessonEndpoint(String id) => '$_teachingEndpoint/$id';
  static String deleteLessonEndpoint(String id) => '$_teachingEndpoint/$id';
}
