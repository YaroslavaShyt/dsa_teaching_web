import 'dart:html' as html;

import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/core/utils/navigation/routes.dart';
import 'package:dsa_teaching_web/data/game/game.dart';
import 'package:dsa_teaching_web/data/game/task.dart';
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
        super(TopicDetailsState());

  final String _topicName;
  final String _categoryName;
  final INavigationUtil _navigationUtil;
  final ILessonRepository _lessonRepository;
  final ILessonService _lessonService;
  final ITeachingRepository _teachingRepository;

  void onBackPressed() {
    _navigationUtil.navigateToAndReplace(AppRoutes.routeInitial);
  }

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
            mode: Mode.initial,
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
    Mode? newMode;

    if (state.mode == Mode.read || state.mode == Mode.initial) {
      newMode = Mode.edit;
    } else if (state.mode == Mode.edit) {
      newMode = Mode.initial;
    }
    emit(state.copyWith(mode: newMode));
  }

  void addLesson() {
    emit(
      state.copyWith(mode: state.mode == Mode.add ? Mode.initial : Mode.add),
    );
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
    for (var category in _lessonService.topicsSummary) {
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
    required html.File? theoryImageStep1,
    required html.File? theoryImageStep2,
    required html.File? theoryImageStep3,
    required html.File? theoryImageStep4,
    bool isNewLesson = false,
    int? theoryId,
  }) async {
    try {
      if (isNewLesson) {
        await _addNew(
          title: title,
          step1: step1,
          step2: step2,
          step3: step3,
          step4: step4,
          theoryStep1: theoryStep1,
          theoryStep2: theoryStep2,
          theoryStep3: theoryStep3,
          theoryStep4: theoryStep4,
          timeLimit: timeLimit,
          tasks: tasks,
          theoryImage1File: theoryImageStep1,
          theoryImage2File: theoryImageStep2,
          theoryImage3File: theoryImageStep3,
          theoryImage4File: theoryImageStep4,
        );
        return;
      }
      await _updateLesson(
        theoryId: theoryId!,
        title: title,
        step1: step1,
        step2: step2,
        step3: step3,
        step4: step4,
        theoryStep1: theoryStep1,
        theoryStep2: theoryStep2,
        theoryStep3: theoryStep3,
        theoryStep4: theoryStep4,
        timeLimit: timeLimit,
        tasks: tasks,
        theoryImageStep1: theoryImageStep1,
        theoryImageStep2: theoryImageStep2,
        theoryImageStep3: theoryImageStep3,
        theoryImageStep4: theoryImageStep4,
      );
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> _addNew({
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
    html.File? theoryImage1File,
    html.File? theoryImage2File,
    html.File? theoryImage3File,
    html.File? theoryImage4File,
  }) async {
    final bool isAdded = await _teachingRepository.addLesson(
      _fetchTopic()!,
      Lesson(
        title: title,
        plan: LessonPlan(
          step1: step1,
          step2: step2,
          step3: step3,
          step4: step4,
        ),
      ),
      Theory(
        theoryStep1: theoryStep1,
        theoryStep2: theoryStep2,
        theoryStep3: theoryStep3,
        theoryStep4: theoryStep4,
        theoryImageStep1: '',
        theoryImageStep2: '',
        theoryImageStep3: '',
        theoryImageStep4: '',
      ),
      Game(title: title, timeLimit: timeLimit, tasks: tasks),
      theoryImage1File,
      theoryImage2File,
      theoryImage3File,
      theoryImage4File,
    );
    if (isAdded) {
      await init();
    }
  }

  Future<void> _updateLesson({
    required int theoryId,
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
    required html.File? theoryImageStep1,
    required html.File? theoryImageStep2,
    required html.File? theoryImageStep3,
    required html.File? theoryImageStep4,
  }) async {
    final bool isUpdated = await _teachingRepository.updateLesson(
      _fetchTopic()!,
      theoryId,
      Lesson(
        id: state.selectedLessonId,
        title: title,
        plan: LessonPlan(
          step1: step1,
          step2: step2,
          step3: step3,
          step4: step4,
        ),
      ),
      Theory(
        theoryStep1: theoryStep1,
        theoryStep2: theoryStep2,
        theoryStep3: theoryStep3,
        theoryStep4: theoryStep4,
        theoryImageStep1: '',
        theoryImageStep2: '',
        theoryImageStep3: '',
        theoryImageStep4: '',
      ),
      Game(
        id: state.selectedGame!.id,
        title: title,
        timeLimit: timeLimit,
        tasks: tasks
            .map(
              (task) => Task(
                id: state.selectedGame!.tasks[tasks.indexOf(task)].id,
                questionNumber: task.questionNumber,
                question: task.question,
                answerOptions: task.answerOptions,
                correctAnswer: task.correctAnswer,
                type: task.type,
              ),
            )
            .toList(),
      ),
      theoryImageStep1,
      theoryImageStep2,
      theoryImageStep3,
      theoryImageStep4,
    );
    if (isUpdated) {
      await init();
    }
  }

  Future<void> deleteLesson(String id) async {
    try {
      emit(state.copyWith(status: TopicDetailsStatus.loading));

      final bool isDeleted = await _teachingRepository.deleteLesson(id);

      if (isDeleted) {
        await init();
        return;
      }
      emit(state.copyWith(status: TopicDetailsStatus.success));
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> deleteTopic() async {
    try {
      emit(state.copyWith(status: TopicDetailsStatus.loading));

      final bool isDeleted = await _teachingRepository.deleteTopic(
        state.topic!.id.toString(),
      );

      if (isDeleted) {
        onBackPressed();
        return;
      }
      emit(state.copyWith(status: TopicDetailsStatus.success));
    } catch (error) {
      logger.e(error);
    }
  }
}
