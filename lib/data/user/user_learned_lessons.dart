import 'package:dsa_teaching_web/domain/user/iuser_learned_lessons.dart';

class UserLearnedLessons implements IUserLearnedLessons {
  UserLearnedLessons({
    required this.title,
    required this.date,
    required this.timeSpent,
  });

  @override
  final String title;
  @override
  final String date;
  @override
  final int timeSpent;

  factory UserLearnedLessons.fromJson(Map<String, dynamic> data) {
    return UserLearnedLessons(
      title: data['lessonName'],
      date: data['date'],
      timeSpent: data['timeSpent'],
    );
  }
}
