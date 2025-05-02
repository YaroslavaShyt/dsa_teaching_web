import 'package:dsa_teaching_web/domain/user/iuser.dart';

const String _id = 'id';
const String _firstName = 'firstName';
const String _email = 'username';
const String _createdAt = 'createdAt';

class User implements IUser {
  User({
    required this.id,
    required this.firstName,
    required this.email,
    required this.createdAt,
  });

  @override
  IUser copyWith({
    String? id,
    String? firstName,
    String? email,
    String? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, String> toJson(IUser user) {
    return {
      _id: id,
      _firstName: firstName,
      _createdAt: createdAt,
      _email: email,
    };
  }

  factory User.fromJson(Map<dynamic, dynamic> data) {
    return User(
      id: data[_id].toString(),
      firstName: data[_firstName],
      email: data[_email],
      createdAt: data[_createdAt],
    );
  }

  @override
  final String id;

  @override
  final String firstName;

  @override
  final String email;

  @override
  final String createdAt;
}
