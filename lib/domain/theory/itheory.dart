abstract interface class ITheory {
  ITheory({
    required this.theoryStep1,
    required this.theoryStep2,
    required this.theoryStep3,
    required this.theoryStep4,
    required this.theoryImageStep1,
    required this.theoryImageStep2,
    required this.theoryImageStep3,
    required this.theoryImageStep4,
  });

  final String theoryStep1;
  final String theoryStep2;
  final String theoryStep3;
  final String theoryStep4;

  final String theoryImageStep1;
  final String theoryImageStep2;
  final String theoryImageStep3;
  final String theoryImageStep4;

  Map<String, dynamic> toJson();
}
