import 'package:dsa_teaching_web/presentation/initial/topic_details/bloc/topic_details_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/info_widget.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/lesson_name_widget.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/lottie_animations/robot_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/topic_details_state.dart';

class TopicDetailsScreen extends StatelessWidget {
  const TopicDetailsScreen({
    required this.cubit,
    super.key,
  });

  final TopicDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TopicDetailsCubit, TopicDetailsState>(
        builder: (context, state) {
          if (state.status == TopicDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == TopicDetailsStatus.nothingFound) {
            return Center(child: Text('Oops'));
          }
          return Padding(
            padding: const EdgeInsetsDirectional.all(20),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Тема: ${state.topic!.title}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height - 95,
                    // color: Colors.red,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...state.topic!.lessons.map(
                                (lesson) {
                                  return LessonNameWidget(
                                    isSelected:
                                        state.selectedLessonId == lesson.id,
                                    lesson: lesson,
                                    onTap: () =>
                                        cubit.onLessonSelected(lesson.id),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        if (state.selectedGame != null &&
                            state.selectedTheory != null)
                          Flexible(
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height - 100,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    InfoWidget(
                                      theory: state.selectedTheory!,
                                      game: state.selectedGame!,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (state.selectedGame == null &&
                            state.selectedTheory == null)
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    width: 2,
                                    color: Colors.white.withValues(alpha: 0.4),
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RobotAnimation(
                                    height: 200,
                                    width: 180,
                                  ),
                                  Text("Оберіть урок, аби побачити деталі"),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
