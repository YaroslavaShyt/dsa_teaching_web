import 'package:dsa_teaching_web/presentation/initial/home/bloc/home_cubit.dart';
import 'package:dsa_teaching_web/presentation/initial/home/widgets/course_list.dart';
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Text("DSA Teaching"),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == HomeStatus.initial) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  MainContainer(
                    margin: const EdgeInsetsDirectional.all(10),
                    padding: const EdgeInsetsDirectional.all(10),
                    content: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Курси",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            ),
                            ...state.lessonsSummary.map(
                              (category) {
                                return CourseList(
                                  category: category,
                                  onTap: cubit.onTopicTap,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return Text('failure');
        },
      ),
    );
  }
}
