import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/core/utils/navigation/routes.dart';
import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:dsa_teaching_web/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_teaching_web/domain/teaching/iteaching_repository.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required ILessonService lessonService,
    required INavigationUtil navigationUtil,
    required ITeachingRepository teachingRepository,
  })  : _lessonService = lessonService,
        _navigationUtil = navigationUtil,
        _teachingRepository = teachingRepository,
        super(HomeState());

  final ILessonService _lessonService;
  final INavigationUtil _navigationUtil;
  final ITeachingRepository _teachingRepository;

  void onTopicTap(ICategory category, ITopic topic) {
    _navigationUtil.navigateTo(
      AppRoutes.topicDetails(category.title, topic.title),
    );
  }

  void onEditTopicTap(ITopic topic, int category) {
    emit(
      state.copyWith(
        selectedTopic: topic,
        addCategoryStatus: AddCategoryStatus.edit,
        selectedCategoryId: category,
      ),
    );
  }

  void onAddTopicPressed() {
    emit(
      state.copyWith(
        addCategoryStatus: state.addCategoryStatus == AddCategoryStatus.active
            ? AddCategoryStatus.initial
            : AddCategoryStatus.active,
      ),
    );
  }

  Future<void> init() async {
    try {
      await _lessonService.init();

      final HomeStatus status = _lessonService.summary.isNotEmpty
          ? HomeStatus.initial
          : HomeStatus.failure;
      emit(
        state.copyWith(
            lessonsSummary: _lessonService.topicsSummary,
            status: status,
            addCategoryStatus: AddCategoryStatus.initial),
      );
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> onAddTopic(
    String name,
    int categoryId,
    bool isEdit,
    int? topicId,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      if (isEdit) {
        final bool isEdited = await _teachingRepository.updateTopic(
          name,
          categoryId,
          topicId.toString(),
        );
        if (isEdited) {
          await init();
          return;
        }
        return;
      }
      final bool isAdded = await _teachingRepository.addTopic(
        name,
        categoryId,
      );
      if (isAdded) {
        await init();
        return;
      }
      emit(state.copyWith(status: HomeStatus.initial));
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> deleteTopic(int id) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final bool isDeleted = await _teachingRepository.deleteTopic(
        id.toString(),
      );

      if (isDeleted) {
        await init();
      } else {
        emit(state.copyWith(status: HomeStatus.initial));
      }
    } catch (error) {
      logger.e(error);
    }
  }
}
