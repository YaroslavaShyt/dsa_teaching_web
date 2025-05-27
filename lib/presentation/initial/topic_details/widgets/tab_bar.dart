import 'package:dsa_teaching_web/data/game/task.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/game/itask.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/game_task.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/tab_bar/main_tab_bar.dart';
import 'package:flutter/material.dart';

class InfoTabBar extends StatelessWidget {
  const InfoTabBar({
    required this.game,
    super.key,
  });

  final IGame game;

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...?game.tasks[TaskLevel.easy]?.map(
              (task) {
                return GameTask(
                  game: game,
                  task: task,
                );
              },
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...?game.tasks[TaskLevel.medium]?.map(
              (task) {
                return GameTask(
                  game: game,
                  task: task,
                );
              },
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...?game.tasks[TaskLevel.hard]?.map(
              (task) {
                return GameTask(
                  game: game,
                  task: task,
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
