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
  final List<ITask> tasks;

  Map<String, dynamic> toJson();
}
