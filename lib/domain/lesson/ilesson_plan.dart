abstract interface class ILessonPlan {
  ILessonPlan({
    required this.step1,
    required this.step2,
    required this.step3,
    required this.step4,
  });

  final String step1;
  final String step2;
  final String step3;
  final String step4;
}
