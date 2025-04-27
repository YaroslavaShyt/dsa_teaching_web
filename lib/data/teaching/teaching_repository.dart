import 'package:dio/dio.dart';
import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/data/networking/endpoints.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson.dart';
import 'package:dsa_teaching_web/domain/networking/inetworking_client.dart';
import 'package:dsa_teaching_web/domain/teaching/iteaching_repository.dart';
import 'package:dsa_teaching_web/domain/theory/itheory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';

class TeachingRepository implements ITeachingRepository {
  TeachingRepository({
    required INetworkingClient networkingClient,
  }) : _networkingClient = networkingClient;

  final INetworkingClient _networkingClient;

  @override
  Future<bool> addLesson(
    ITopic topic,
    ILesson lesson,
    ITheory theory,
    IGame game,
  ) async {
    try {
      final Response? response = await _networkingClient.post(
        Endpoints.addLessonEndpoint,
        body: {
          'topicId': topic.id,
          ...lesson.toJson(),
          ...theory.toJson(),
          ...game.toJson(),
        },
      );

      if (response?.statusCode == 201 || response?.statusCode == 200) {
        return true;
      }
    } catch (error) {
      logger.e(error);
    }
    return false;
  }

  @override
  Future<bool> deleteLesson(String lessonId) {
    // TODO: implement deleteLesson
    throw UnimplementedError();
  }

  @override
  Future<bool> updateLesson(
    ITopic topic,
    ILesson lesson,
    ITheory theory,
    IGame game,
  ) async {
    try {
      final Response? response = await _networkingClient.put(
        Endpoints.updateLessonEndpoint(lesson.id!.toString()),
        body: {
          'topicId': topic.id.toString(),
          ...lesson.toJson(),
          ...theory.toJson(),
          ...game.toJson(),
        },
      );

      if (response?.statusCode == 201 || response?.statusCode == 200) {
        return true;
      }
    } catch (error) {
      logger.e(error);
    }
    return false;
  }
}
