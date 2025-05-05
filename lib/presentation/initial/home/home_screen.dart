import 'package:dsa_teaching_web/presentation/initial/home/bloc/home_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/home/widgets/add_category/add_category_widget.dart';
import 'package:dsa_teaching_web/presentation/initial/home/widgets/add_topic_button.dart';
import 'package:dsa_teaching_web/presentation/initial/home/widgets/course_list.dart';
import 'package:dsa_teaching_web/presentation/initial/home/widgets/main_app_bar.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.cubit,
    super.key,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == HomeStatus.initial) {
            return Container(
              padding: const EdgeInsetsDirectional.all(10),
              height: MediaQuery.sizeOf(context).height - 100,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainAppBar(
                      userName: cubit.userName,
                      onExitTap: cubit.onExitTap,
                      onUsersTap: cubit.onUsersTap,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: MainContainer(
                            margin: const EdgeInsetsDirectional.only(end: 10),
                            padding: const EdgeInsetsDirectional.all(10),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Курси",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                      ),
                                    ),
                                    AddTopicButton(
                                      onTap: cubit.onAddTopicPressed,
                                      status: state.addCategoryStatus,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                ...state.lessonsSummary.map(
                                  (category) {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        bottom: 10,
                                      ),
                                      child: CourseList(
                                        category: category,
                                        onTap: cubit.onTopicTap,
                                        delete: cubit.deleteTopic,
                                        onAddPressed: cubit.onAddTopicPressed,
                                        onEdit: cubit.onEditTopicTap,
                                        addCategoryStatus:
                                            state.addCategoryStatus,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (state.addCategoryStatus == AddCategoryStatus.active)
                          AddCategoryWidget(
                            save: cubit.onAddTopic,
                            categories: state.lessonsSummary,
                          ),
                        if (state.addCategoryStatus == AddCategoryStatus.edit)
                          AddCategoryWidget(
                            save: cubit.onAddTopic,
                            categories: state.lessonsSummary,
                            topic: state.selectedTopic,
                            categoryId: state.selectedCategoryId,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Text('Щось пішло не так');
        },
      ),
    );
  }
}
