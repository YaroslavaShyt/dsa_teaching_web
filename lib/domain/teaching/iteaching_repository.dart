import 'package:dsa_teaching_web/data/teaching/web_file.dart';
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
    WebFile? file1,
    WebFile? file2,
    WebFile? file3,
    WebFile? file4,
  );

  Future<bool> updateLesson(
    ITopic topic,
    int theoryId,
    ILesson lesson,
    ITheory theory,
    IGame game,
    WebFile? file1,
    WebFile? file2,
    WebFile? file3,
    WebFile? file4,
  );

  Future<bool> deleteLesson(String lessonId);

  Future<bool> addTopic(String topic, int categoryId);

  Future<bool> updateTopic(String topic, int categoryId, String topicId);

  Future<bool> deleteTopic(String topicId);
}
