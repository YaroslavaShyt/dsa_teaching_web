import 'package:dsa_teaching_web/domain/lesson/ilesson.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';

class Topic implements ITopic {
  Topic({
    this.id,
    required this.title,
    required this.lessons,
  });

  @override
  final int? id;

  @override
  final String title;

  @override
  final List<ILesson> lessons;
}
