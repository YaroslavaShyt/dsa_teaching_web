import 'dart:convert';

import 'package:dsa_teaching_web/data/game/task.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';

import '../../domain/game/itask.dart';

const String _gameId = 'gameId';
const String _gameName = 'gameName';
const String _timeLimit = 'timeLimit';
const String _gameTasks = 'gameTasks';

class Game implements IGame {
  Game({
    required this.title,
    required this.timeLimit,
    required this.tasks,
    this.id,
  });

  factory Game.fromJson(Map<String, dynamic> data) {
    return Game(
      id: data[_gameId],
      title: data[_gameName],
      timeLimit: data[_timeLimit],
      tasks: data[_gameTasks]
          .map<ITask>(
            (task) => Task.fromJson(task),
          )
          .toList(),
    );
  }

  @override
  final int? id;

  @override
  final String title;

  @override
  final int timeLimit;

  @override
  final List<ITask> tasks;

  @override
  Map<String, dynamic> toJson() {
    return {
      'gameId': id,
      'gameName': title,
      'timeLimit': timeLimit,
      'gameTasks': json.encode(tasks.map((task) => task.toJson()).toList()),
    };
  }
}
