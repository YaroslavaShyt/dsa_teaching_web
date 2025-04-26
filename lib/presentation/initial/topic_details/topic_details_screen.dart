import 'package:dsa_teaching_web/presentation/initial/topic_details/bloc/topic_details_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/info_widget.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/lesson_list.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/select_lesson_placeholder.dart';
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LessonList(
                          selectedLesson: state.selectedLessonId ?? 0,
                          lessons: state.topic!,
                          onLessonSelected: cubit.onLessonSelected,
                        ),
                        if (state.selectedGame != null &&
                            state.selectedTheory != null)
                          InfoWidget(
                            theory: state.selectedTheory!,
                            game: state.selectedGame!,
                          ),
                        if (state.selectedGame == null &&
                            state.selectedTheory == null)
                          const SelectLessonPlaceholder(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
