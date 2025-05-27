import 'dart:convert';

import 'package:dsa_teaching_web/data/game/task.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import '../../domain/game/itask.dart';

const String _gameId = 'gameId';
const String _gameName = 'gameName';
const String _timeLimit = 'timeLimit';
const String _tasksByLevel = 'tasksByLevel';
const String _gameTasks = 'gameTasks';

class Game implements IGame {
  Game({
    required this.title,
    required this.timeLimit,
    required this.tasks,
    this.id,
  });

  factory Game.fromJson(Map<String, dynamic> data) {
    final Map<TaskLevel, List<ITask>> parsedTasks = {};
    (data[_tasksByLevel] as Map<String, dynamic>)
        .forEach((levelStr, tasksList) {
      final level = TaskLevel.values.firstWhere(
        (e) => e.apiString == levelStr,
        orElse: () => TaskLevel.easy,
      );

      parsedTasks[level] = (tasksList as List)
          .map<ITask>((task) => Task.fromJson(task))
          .toList();
    });

    return Game(
      id: data[_gameId],
      title: data[_gameName],
      timeLimit: data[_timeLimit],
      tasks: parsedTasks,
    );
  }

  @override
  final int? id;

  @override
  final String title;

  @override
  final int timeLimit;

  @override
  final Map<TaskLevel, List<ITask>> tasks;

  @override
  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> list = [];

    tasks.forEach((level, taskList) {
      list.addAll(taskList.map<Map<String, dynamic>>((task) => task.toJson()));
    });

    return {
      _gameId: id,
      _gameName: title,
      _timeLimit: timeLimit,
      _gameTasks: json.encode(list),
    };
  }
}
