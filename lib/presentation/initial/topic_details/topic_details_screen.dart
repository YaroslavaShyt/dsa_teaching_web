import 'package:dsa_teaching_web/presentation/initial/topic_details/bloc/topic_details_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/editable_info_widget.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/info_widget.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/lesson_list.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/select_lesson_placeholder.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/topic_row_widget.dart';
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
                  TopicRowWidget(
                    title: state.topic!.title,
                    onAddPressed: cubit.addLesson,
                    onBackPressed: cubit.onBackPressed,
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height - 105,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LessonList(
                          onDelete: cubit.deleteLesson,
                          onTap: cubit.changeMode,
                          mode: state.mode,
                          selectedLesson: state.selectedLessonId ?? 0,
                          lessons: state.topic!,
                          onLessonSelected: cubit.onLessonSelected,
                        ),
                        if (state.mode == Mode.add)
                          EditableInfoWidget(
                            saveInfo: cubit.saveInfo,
                          ),
                        if (state.selectedGame != null &&
                            state.selectedTheory != null) ...[
                          if (state.mode == Mode.read)
                            InfoWidget(
                              theory: state.selectedTheory!,
                              game: state.selectedGame!,
                            ),
                          if (state.mode == Mode.edit)
                            EditableInfoWidget(
                              theory: state.selectedTheory!,
                              game: state.selectedGame!,
                              saveInfo: cubit.saveInfo,
                            ),
                        ],
                        if (state.selectedGame == null &&
                            state.selectedTheory == null) ...[
                          if (state.mode == Mode.read)
                            const SelectLessonPlaceholder(),
                        ],
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
