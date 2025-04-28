import 'package:dsa_teaching_web/domain/category/icategory.dart';

abstract interface class ILessonService {
  Future<void> init();

  List<ICategory> get summary;

  List<ICategory> get topicsSummary;
}
