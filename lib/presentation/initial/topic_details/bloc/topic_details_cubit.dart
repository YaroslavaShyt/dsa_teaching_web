import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson_repository.dart';
import 'package:dsa_teaching_web/domain/services/lesson/ilesson_service.dart';
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
  })  : _navigationUtil = navigationUtil,
        _lessonRepository = lessonRepository,
        _lessonService = lessonService,
        _topicName = topicName,
        _categoryName = categoryName,
        super(
          TopicDetailsState(),
        );

  final String _topicName;
  final String _categoryName;
  final INavigationUtil _navigationUtil;
  final ILessonRepository _lessonRepository;
  final ILessonService _lessonService;

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

  Future<void> onLessonSelected(int lessonId) async {
    try {
      final data = await Future.wait([
        _lessonRepository.getLessonGame(lessonId),
        _lessonRepository.getLessonTheory(lessonId),
      ]);

      final ILessonTheory? theory = data.last as ILessonTheory?;
      final IGame? game = data.first as IGame?;

      emit(state.copyWith(
        selectedTheory: theory,
        selectedGame: game,
        selectedLessonId: lessonId,
      ));
    } catch (error) {
      logger.e(error);
    }
  }
}
