import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson_repository.dart';
import 'package:dsa_teaching_web/domain/services/lesson/ilesson_service.dart';

const String _algorithms = "ALGORITHMS";
const String _dataStructures = "DATA_STRUCTURES";

class LessonService implements ILessonService {
  LessonService({
    required ILessonRepository lessonRepository,
  }) : _lessonRepository = lessonRepository;

  final ILessonRepository _lessonRepository;

  @override
  List<ICategory> get summary => _summary;

  List<ICategory> _summary = [];

  @override
  Future<void> init() async {
    try {
      _summary = await _lessonRepository.getLessonsSummary();
    } catch (error) {
      logger.e(error);
    }
  }
}
