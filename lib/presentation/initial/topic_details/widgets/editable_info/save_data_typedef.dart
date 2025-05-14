part of 'editable_info_widget.dart';

typedef SaveDataFunction = Future<void> Function({
  required String title,
  required String step1,
  required String step2,
  required String step3,
  required String step4,
  required String theoryStep1,
  required String theoryStep2,
  required String theoryStep3,
  required String theoryStep4,
  required html.File? theoryImageStep1,
  required html.File? theoryImageStep2,
  required html.File? theoryImageStep3,
  required html.File? theoryImageStep4,
  required int timeLimit,
  required List<ITask> tasks,
  required bool isNewLesson,
  required int? theoryId,
});
