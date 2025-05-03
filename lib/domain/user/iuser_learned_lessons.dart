abstract interface class IUserLearnedLessons {
  IUserLearnedLessons({
    required this.title,
    required this.date,
    required this.timeSpent,
  });

  final String title;
  final String date;
  final int timeSpent;
}
