import 'itask.dart';

abstract interface class IGame {
  IGame({
    required this.id,
    required this.title,
    required this.timeLimit,
    required this.tasks,
  });

  final int id;
  final String title;
  final int timeLimit;
  final List<ITask> tasks;
}
