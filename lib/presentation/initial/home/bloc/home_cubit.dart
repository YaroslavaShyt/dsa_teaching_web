import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/core/utils/navigation/routes.dart';
import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:dsa_teaching_web/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required ILessonService lessonService,
    required INavigationUtil navigationUtil,
  })  : _lessonService = lessonService,
        _navigationUtil = navigationUtil,
        super(HomeState());

  final ILessonService _lessonService;
  final INavigationUtil _navigationUtil;

  void onTopicTap(ICategory category, ITopic topic) {
    _navigationUtil.navigateTo(
      AppRoutes.topicDetails(category.title, topic.title),
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
          lessonsSummary: _lessonService.summary,
          status: status,
        ),
      );
    } catch (error) {
      logger.e(error);
    }
  }
}
