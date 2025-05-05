import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson_repository.dart';
import 'package:dsa_teaching_web/domain/services/lesson/ilesson_service.dart';

class LessonService implements ILessonService {
  LessonService({
    required ILessonRepository lessonRepository,
  }) : _lessonRepository = lessonRepository;

  final ILessonRepository _lessonRepository;

  @override
  List<ICategory> get summary => _summary;

  List<ICategory> _summary = [];

  @override
  List<ICategory> get topicsSummary => _topicsSummary;
  List<ICategory> _topicsSummary = [];

  @override
  Future<void> init() async {
    try {
      final data = await Future.wait(
        [
          _lessonRepository.getLessonsSummary(),
          _lessonRepository.getTopicsSummary(),
        ],
      );
      _summary = data.first;

      _topicsSummary = data.last;
    } catch (error) {
      logger.e(error);
    }
  }
}
