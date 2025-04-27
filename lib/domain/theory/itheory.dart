abstract interface class ITheory {
  ITheory({
    required this.theoryStep1,
    required this.theoryStep2,
    required this.theoryStep3,
    required this.theoryStep4,
  });

  final String theoryStep1;
  final String theoryStep2;
  final String theoryStep3;
  final String theoryStep4;

  Map<String, dynamic> toJson();
}
