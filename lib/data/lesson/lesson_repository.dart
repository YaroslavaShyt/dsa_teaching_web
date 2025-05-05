import 'package:dio/dio.dart';

import '../../core/utils/logger/logger.dart';
import '../../domain/category/icategory.dart';
import '../../domain/game/igame.dart';
import '../../domain/lesson/ilesson.dart';
import '../../domain/lesson/ilesson_repository.dart';
import '../../domain/networking/inetworking_client.dart';
import '../../domain/theory/ilesson_theory.dart';
import '../../domain/topic/itopic.dart';
import '../category/category.dart';
import '../game/game.dart';
import '../networking/endpoints.dart';
import '../theory/lesson_theory.dart';
import '../topic/topic.dart';
import 'lesson.dart';

part 'lesson_repo_parser.dart';

class LessonRepository implements ILessonRepository {
  LessonRepository({
    required INetworkingClient networkingClient,
  }) : _networkingClient = networkingClient;

  final INetworkingClient _networkingClient;

  @override
  Future<List<ICategory>> getLessonsSummary() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.getLessonSummaryEndpoint,
      );

      if (response == null) return [];
      return response.data.keys.map<ICategory>(
        (String category) {
          return _createCategory(category, response.data[category]);
        },
      ).toList();
    } catch (error) {
      logger.e(error);
    }
    return [];
  }

  @override
  Future<List<ICategory>> getTopicsSummary() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.getTopicsSummaryEndpoint,
      );

      if (response == null) return [];

      List<ICategory> categories = [];

      for (var map in response.data) {
        categories.add(
          Category(
            id: map['categoryId'],
            title: map['categoryName'],
            topics: map['topics']
                .map<ITopic>(
                  (topic) => Topic(
                    id: topic['id'],
                    title: topic['topicName'],
                    lessons: [],
                  ),
                )
                .toList(),
          ),
        );
      }
      return categories;
    } catch (error) {
      logger.e(error);
    }
    return [];
  }

  @override
  Future<ILessonTheory?> getLessonTheory(int id) async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.getLessonTheory(id),
      );

      if (response == null) return null;

      return LessonTheory.fromJson(response.data);
    } catch (error) {
      logger.e(error);
    }
    return null;
  }

  @override
  Future<IGame?> getLessonGame(int id) async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.getLessonGame(id),
      );

      if (response == null) return null;

      return Game.fromJson(response.data);
    } catch (error) {
      logger.e(error);
    }
    return null;
  }
}
