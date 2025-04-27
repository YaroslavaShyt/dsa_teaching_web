import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/data/game/game.dart';
import 'package:dsa_teaching_web/data/lesson/lesson.dart';
import 'package:dsa_teaching_web/data/lesson/lesson_plan.dart';
import 'package:dsa_teaching_web/data/theory/theory.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/game/itask.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson_repository.dart';
import 'package:dsa_teaching_web/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_teaching_web/domain/teaching/iteaching_repository.dart';
import 'package:dsa_teaching_web/domain/theory/ilesson_theory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/bloc/topic_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicDetailsCubit extends Cubit<TopicDetailsState> {
  TopicDetailsCubit({
    required INavigationUtil navigationUtil,
    required ILessonRepository lessonRepository,
    required String categoryName,
    required String topicName,
    required ILessonService lessonService,
    required ITeachingRepository teachingRepository,
  })  : _navigationUtil = navigationUtil,
        _lessonRepository = lessonRepository,
        _lessonService = lessonService,
        _topicName = topicName,
        _categoryName = categoryName,
        _teachingRepository = teachingRepository,
        super(
          TopicDetailsState(),
        );

  final String _topicName;
  final String _categoryName;
  final INavigationUtil _navigationUtil;
  final ILessonRepository _lessonRepository;
  final ILessonService _lessonService;
  final ITeachingRepository _teachingRepository;

  Future<void> init() async {
    try {
      emit(state.copyWith(status: TopicDetailsStatus.loading));
      await _lessonService.init();

      final ITopic? topic = _fetchTopic();
      if (topic != null) {
        emit(
          state.copyWith(
            topic: topic,
            status: TopicDetailsStatus.success,
          ),
        );
        return;
      }
      emit(state.copyWith(status: TopicDetailsStatus.nothingFound));
    } catch (error) {
      logger.e(error);
    }
  }

  void changeMode() {
    final Mode newMode = state.mode == Mode.read ? Mode.edit : Mode.read;
    emit(state.copyWith(mode: newMode));
  }

  void addLesson() {
    emit(state.copyWith(mode: Mode.add));
  }

  ITopic? _fetchTopic() {
    for (var category in _lessonService.summary) {
      if (category.title == _categoryName) {
        for (var topic in category.topics) {
          if (topic.title == _topicName) {
            return topic;
          }
        }
      }
    }
    return null;
  }

  Future<void> onLessonSelected(int lessonId, int gameId, Mode mode) async {
    try {
      final data = await Future.wait([
        _lessonRepository.getLessonGame(gameId),
        _lessonRepository.getLessonTheory(lessonId),
      ]);

      final ILessonTheory? theory = data.last as ILessonTheory?;
      final IGame? game = data.first as IGame?;

      emit(state.copyWith(
        selectedTheory: theory,
        selectedGame: game,
        selectedLessonId: lessonId,
        mode: mode,
      ));
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> saveInfo({
    required String title,
    required String step1,
    required String step2,
    required String step3,
    required String step4,
    required String theoryStep1,
    required String theoryStep2,
    required String theoryStep3,
    required String theoryStep4,
    required int timeLimit,
    required List<ITask> tasks,
  }) async {
    try {
      final bool isAdded = await _teachingRepository.addLesson(
        _fetchTopic()!,
        Lesson(
          title: title,
          plan: LessonPlan(
              step1: step1, step2: step2, step3: step3, step4: step4),
        ),
        Theory(
          theoryStep1: theoryStep1,
          theoryStep2: theoryStep2,
          theoryStep3: theoryStep3,
          theoryStep4: theoryStep4,
        ),
        Game(title: title, timeLimit: timeLimit, tasks: tasks),
      );
      if (isAdded) {
        await init();
      }
    } catch (error) {
      logger.e(error);
    }
  }
}
