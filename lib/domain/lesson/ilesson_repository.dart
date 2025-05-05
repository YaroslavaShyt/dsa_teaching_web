import 'package:dsa_teaching_web/domain/category/icategory.dart';

import '../game/igame.dart';
import '../theory/ilesson_theory.dart';

abstract interface class ILessonRepository {
  Future<List<ICategory>> getLessonsSummary();

  Future<List<ICategory>> getTopicsSummary();

  Future<ILessonTheory?> getLessonTheory(int id);

  Future<IGame?> getLessonGame(int id);
}
