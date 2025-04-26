import 'package:dsa_teaching_web/domain/lesson/ilesson.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';

class Topic implements ITopic {
  Topic({
    required this.title,
    required this.lessons,
  });

  @override
  final String title;

  @override
  final List<ILesson> lessons;
}
