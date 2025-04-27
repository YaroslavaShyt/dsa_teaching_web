import 'package:dsa_teaching_web/domain/game/itask.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/info_widget.dart';
import 'package:flutter/material.dart';

class GameTasksList extends StatefulWidget {
  const GameTasksList({
    required this.task,
    super.key,
  });

  final ITask task;

  @override
  State<GameTasksList> createState() => _GameTasksListState();
}

class _GameTasksListState extends State<GameTasksList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.task.question),
          ...widget.task.answerOptions.map(
            (option) {
              final index = widget.task.answerOptions.indexOf(option);
              return Row(
                children: [
                  Radio<String>(
                    value: option,
                    groupValue: widget.task.correctAnswer,
                    onChanged: (_) {
                      setState(() {
                        widget.task.correctAnswer = option;
                      });
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: option,
                      decoration: InputDecoration(
                        labelText: "${letters[index]})",
                      ),
                      onChanged: (newText) {
                        setState(
                          () {
                            widget.task.answerOptions[index] = newText;
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
