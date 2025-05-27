import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/add_tasks_form.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/tab_bar/main_tab_bar.dart';
import 'package:flutter/material.dart';

class EditInfoTabBar extends StatelessWidget {
  const EditInfoTabBar({
    required this.gameControllersEasy,
    required this.gameControllersMedium,
    required this.gameControllersHard,
    super.key,
  });

  final List<List<TextEditingController>> gameControllersEasy;
  final List<List<TextEditingController>> gameControllersMedium;
  final List<List<TextEditingController>> gameControllersHard;

  @override
  Widget build(BuildContext context) {
    return MainTabBar(
      tabs: [
        Tab(
          text: 'Початковий рівень',
        ),
        Tab(
          text: 'Середній рівень',
        ),
        Tab(
          text: 'Поглиблений рівень',
        )
      ],
      tabBarContent: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddTasksForm(
                gameControllers: gameControllersEasy,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddTasksForm(
                gameControllers: gameControllersMedium,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddTasksForm(
                gameControllers: gameControllersHard,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
