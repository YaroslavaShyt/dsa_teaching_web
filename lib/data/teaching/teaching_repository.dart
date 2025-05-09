import 'dart:async';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dsa_teaching_web/core/utils/logger/logger.dart';
import 'package:dsa_teaching_web/data/networking/endpoints.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson.dart';
import 'package:dsa_teaching_web/domain/networking/inetworking_client.dart';
import 'package:dsa_teaching_web/domain/teaching/iteaching_repository.dart';
import 'package:dsa_teaching_web/domain/theory/itheory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';

const _topicId = 'topicId';

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
    html.File? file1,
    html.File? file2,
    html.File? file3,
    html.File? file4,
  ) async {
    try {
      final formData = FormData.fromMap({
        _topicId: topic.id,
        ...lesson.toJson(),
        ...theory.toJson(),
        ...game.toJson(),
        if (file1 != null)
          'theoryImageStep1': MultipartFile.fromBytes(
            await _getFileBytes(file1),
            filename: file1.name,
          ),
        if (file2 != null)
          'theoryImageStep2': MultipartFile.fromBytes(
            await _getFileBytes(file2),
            filename: file2.name,
          ),
        if (file3 != null)
          'theoryImageStep3': MultipartFile.fromBytes(
            await _getFileBytes(file3),
            filename: file3.name,
          ),
        if (file4 != null)
          'theoryImageStep4': MultipartFile.fromBytes(
            await _getFileBytes(file4),
            filename: file4.name,
          ),
      });
      final Response? response = await _networkingClient.post(
        Endpoints.addLessonEndpoint,
        body: formData,
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
  Future<bool> deleteLesson(String lessonId) async {
    try {
      final Response? response = await _networkingClient.delete(
        Endpoints.deleteLessonEndpoint(lessonId),
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
  Future<bool> updateLesson(
    ITopic topic,
    ILesson lesson,
    ITheory theory,
    IGame game,
    html.File? file1,
    html.File? file2,
    html.File? file3,
    html.File? file4,
  ) async {
    try {
      final formData = FormData.fromMap({
        _topicId: topic.id,
        ...lesson.toJson(),
        ...theory.toJson(),
        ...game.toJson(),
        if (file1 != null)
          'theoryImageStep1': MultipartFile.fromBytes(
            await _getFileBytes(file1),
            filename: file1.name,
          ),
        if (file2 != null)
          'theoryImageStep2': MultipartFile.fromBytes(
            await _getFileBytes(file2),
            filename: file2.name,
          ),
        if (file3 != null)
          'theoryImageStep3': MultipartFile.fromBytes(
            await _getFileBytes(file3),
            filename: file3.name,
          ),
        if (file4 != null)
          'theoryImageStep4': MultipartFile.fromBytes(
            await _getFileBytes(file4),
            filename: file4.name,
          ),
      });

      final Response? response = await _networkingClient.put(
        Endpoints.updateLessonEndpoint(lesson.id!.toString()),
        body: formData,
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
  Future<bool> addTopic(String topic, int categoryId) async {
    try {
      final Response? response = await _networkingClient.post(
        Endpoints.addTopicEndpoint,
        body: {
          "topicName": topic,
          "categoryId": categoryId,
        },
      );

      if (response?.statusCode == 200) {
        return true;
      }
    } catch (error) {
      logger.e(error);
    }
    return false;
  }

  @override
  Future<bool> updateTopic(String topic, int categoryId, String topicId) async {
    try {
      final Response? response = await _networkingClient.put(
        Endpoints.updateTopicEndpoint(topicId),
        body: {
          "topicName": topic,
          "categoryId": categoryId,
        },
      );

      if (response?.statusCode == 200) {
        return true;
      }
    } catch (error) {
      logger.e(error);
    }
    return false;
  }

  @override
  Future<bool> deleteTopic(String topicId) async {
    try {
      final Response? response = await _networkingClient.delete(
        Endpoints.deleteTopicEndpoint(topicId),
      );

      if (response?.statusCode == 204) {
        return true;
      }
    } catch (error) {
      logger.e(error);
    }
    return false;
  }

  Future<Uint8List> _getFileBytes(html.File file) async {
    final reader = html.FileReader();
    final completer = Completer<Uint8List>();

    reader.onLoadEnd.listen((_) {
      completer.complete(reader.result as Uint8List);
    });

    reader.readAsArrayBuffer(file);
    return completer.future;
  }
}
