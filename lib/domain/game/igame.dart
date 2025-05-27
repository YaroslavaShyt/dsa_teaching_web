import 'package:dsa_teaching_web/data/game/task.dart';

import 'itask.dart';

abstract interface class IGame {
  IGame({
    required this.title,
    required this.timeLimit,
    required this.tasks,
    this.id,
  });

  final int? id;
  final String title;
  final int timeLimit;
  final Map<TaskLevel, List<ITask>> tasks;

  Map<String, dynamic> toJson();
}
