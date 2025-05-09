import 'dart:html' as html;

import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';

import '../theory/itheory.dart';

abstract interface class ITeachingRepository {
  Future<bool> addLesson(
    ITopic topic,
    ILesson lesson,
    ITheory theory,
    IGame game,
    html.File? file1,
    html.File? file2,
    html.File? file3,
    html.File? file4,
  );

  Future<bool> updateLesson(
    ITopic topic,
    int theoryId,
    ILesson lesson,
    ITheory theory,
    IGame game,
    html.File? file1,
    html.File? file2,
    html.File? file3,
    html.File? file4,
  );

  Future<bool> deleteLesson(String lessonId);

  Future<bool> addTopic(String topic, int categoryId);

  Future<bool> updateTopic(String topic, int categoryId, String topicId);

  Future<bool> deleteTopic(String topicId);
}
