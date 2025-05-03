import 'package:dio/dio.dart';
import 'package:dsa_teaching_web/data/user/user.dart';
import 'package:dsa_teaching_web/data/user/user_learned_lessons.dart';
import 'package:dsa_teaching_web/domain/user/iuser_learned_lessons.dart';

import '../../core/utils/logger/logger.dart';
import '../../domain/networking/inetworking_client.dart';
import '../../domain/user/iuser.dart';
import '../../domain/user/iuser_repository.dart';
import '../networking/endpoints.dart';

class UserRepository implements IUserRepository {
  UserRepository({
    required INetworkingClient networkingClient,
  }) : _networkingClient = networkingClient;

  final INetworkingClient _networkingClient;

  @override
  Future<IUser?> getUser() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.userEndpoint,
      );

      if (response == null) return null;

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
    } catch (error) {
      logger.e(error);
      rethrow;
    }
    return null;
  }

  @override
  Future<List<IUser>> getAllUsers() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.allUsersEndpoint,
      );
      if (response?.statusCode == 200) {
        return response?.data
            .map<IUser>((json) => User.fromJson(json))
            .toList();
      }
    } catch (error) {
      logger.e(error);
    }
    return [];
  }

  @override
  Future<void> updateUser(Map<String, String> data) async {
    try {
      await _networkingClient.put(
        Endpoints.userEndpoint,
        body: data,
      );
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<bool> deleteUser() async {
    try {
      final Response? response =
          await _networkingClient.delete(Endpoints.userEndpoint);
      if (response == null) return false;

      if (response.statusCode == 200) return true;
    } catch (error) {
      logger.e(error);
    }
    return false;
  }

  @override
  Future<List<IUserLearnedLessons>> getUserLearnedLessons(int id) async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.statisticsEndpoint(id),
      );

      if (response?.statusCode == 200) {
        return response?.data
            .map<IUserLearnedLessons>(
                (json) => UserLearnedLessons.fromJson(json))
            .toList();
      }
    } catch (error) {
      logger.e(error);
    }
    return [];
  }
}
