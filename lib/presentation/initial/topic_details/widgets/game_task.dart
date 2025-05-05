import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/game/itask.dart';
import 'package:flutter/material.dart';

import 'info_widget.dart';

class GameTask extends StatelessWidget {
  const GameTask({
    required this.game,
    required this.task,
    super.key,
  });

  final IGame game;
  final ITask task;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 8),
            child: Text(
              "${game.tasks.indexOf(task) + 1}. ${task.question}",
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
          ...task.answerOptions.map(
            (option) {
              final bool isCorrect = option == task.correctAnswer;
              return Padding(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: Text(
                  "${letters[task.answerOptions.indexOf(option)]}. $option",
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: isCorrect ? FontWeight.w700 : null,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
