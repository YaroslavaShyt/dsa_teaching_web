import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/core/utils/service_locator/service_locator.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson_repository.dart';
import 'package:dsa_teaching_web/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/bloc/topic_details_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/topic_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicDetailsRoutingArgs {
  TopicDetailsRoutingArgs({
    required this.categoryName,
    required this.topicName,
  });

  final String categoryName;
  final String topicName;
}

class TopicDetailsFactory {
  static Widget build(TopicDetailsRoutingArgs args) {
    return BlocProvider<TopicDetailsCubit>(
      create: (context) {
        return TopicDetailsCubit(
          navigationUtil: sl.get<INavigationUtil>(),
          lessonService: sl.get<ILessonService>(),
          categoryName: args.categoryName,
          topicName: args.topicName,
          lessonRepository: sl.get<ILessonRepository>(),
        )..init();
      },
      child: Builder(
        builder: (context) {
          return TopicDetailsScreen(
            cubit: BlocProvider.of<TopicDetailsCubit>(context),
          );
        },
      ),
    );
  }
}
