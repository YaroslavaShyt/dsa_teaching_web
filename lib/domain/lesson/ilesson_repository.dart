import 'package:dsa_teaching_web/domain/category/icategory.dart';

import '../game/igame.dart';
import '../theory/ilesson_theory.dart';

abstract interface class ILessonRepository {
  Future<List<ICategory>> getLessonsSummary();

  Future<ILessonTheory?> getLessonTheory(int id);

  Future<IGame?> getLessonGame(int id);

  Future<Map<String, List<int>>> getLearnedLessonsIds();

  Future<void> completeLesson(int id, int time);
}
