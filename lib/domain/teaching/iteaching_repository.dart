import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';

import '../theory/itheory.dart';

abstract interface class ITeachingRepository {
  Future<bool> addLesson(
      ITopic topic, ILesson lesson, ITheory theory, IGame game);

  Future<bool> updateLesson(ILesson lesson, IGame game);

  Future<bool> deleteLesson(String lessonId);
}
