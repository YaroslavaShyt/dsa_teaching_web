import 'package:dsa_teaching_web/domain/theory/itheory.dart';

class Theory implements ITheory {
  Theory({
    required this.theoryStep1,
    required this.theoryStep2,
    required this.theoryStep3,
    required this.theoryStep4,
    required this.theoryImageStep1,
    required this.theoryImageStep2,
    required this.theoryImageStep3,
    required this.theoryImageStep4,
  });

  @override
  final String theoryStep1;

  @override
  final String theoryStep2;

  @override
  final String theoryStep3;

  @override
  final String theoryStep4;

  @override
  final String theoryImageStep1;
  @override
  final String theoryImageStep2;
  @override
  final String theoryImageStep3;
  @override
  final String theoryImageStep4;

  @override
  Map<String, dynamic> toJson() {
    return {
      'theoryStep1': theoryStep1,
      'theoryStep2': theoryStep2,
      'theoryStep3': theoryStep3,
      'theoryStep4': theoryStep4,
    };
  }
}
