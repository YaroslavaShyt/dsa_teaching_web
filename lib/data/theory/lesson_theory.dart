import 'package:dsa_teaching_web/data/theory/theory.dart';

import '../../domain/lesson/ilesson_plan.dart';
import '../../domain/theory/ilesson_theory.dart';
import '../../domain/theory/itheory.dart';
import '../lesson/lesson_plan.dart';

const String _endpoint = String.fromEnvironment('url');

const String _lessonTitle = 'lessonTitle';
const String _step1Plan = 'step1Plan';
const String _step2Plan = 'step2Plan';
const String _step3Plan = 'step3Plan';
const String _step4Plan = 'step4Plan';
const String _theoryStep1 = 'theoryStep1';
const String _theoryStep2 = 'theoryStep2';
const String _theoryStep3 = 'theoryStep3';
const String _theoryStep4 = 'theoryStep4';
const String _theoryImageStep1 = 'theoryImageStep1';
const String _theoryImageStep2 = 'theoryImageStep2';
const String _theoryImageStep3 = 'theoryImageStep3';
const String _theoryImageStep4 = 'theoryImageStep4';

class LessonTheory implements ILessonTheory {
  LessonTheory({
    required this.lessonTitle,
    required this.lessonPlan,
    required this.lessonTheory,
  });

  factory LessonTheory.fromJson(Map<String, dynamic> data) {
    return LessonTheory(
      lessonTitle: data[_lessonTitle],
      lessonPlan: LessonPlan(
        step1: data[_step1Plan],
        step2: data[_step2Plan],
        step3: data[_step3Plan],
        step4: data[_step4Plan],
      ),
      lessonTheory: Theory(
        theoryStep1: data[_theoryStep1],
        theoryStep2: data[_theoryStep2],
        theoryStep3: data[_theoryStep3],
        theoryStep4: data[_theoryStep4],
        theoryImageStep1: _getImage(data[_theoryImageStep1]),
        theoryImageStep2: _getImage(data[_theoryImageStep2]),
        theoryImageStep3: _getImage(data[_theoryImageStep3]),
        theoryImageStep4: _getImage(data[_theoryImageStep4]),
      ),
    );
  }

  @override
  final String lessonTitle;

  @override
  final ILessonPlan lessonPlan;

  @override
  final ITheory lessonTheory;

  static String _getImage(String? path) {
    if (path != null && path.startsWith('/files/theory/')) {
      return 'http://$_endpoint$path';
    }
    return '';
  }
}
