import 'package:dsa_teaching_web/domain/user/iuser.dart';

const String _id = 'id';
const String _firstName = 'firstName';

class User implements IUser {
  User({
    required this.id,
    required this.firstName,
  });

  @override
  IUser copyWith({
    String? id,
    String? firstName,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
    );
  }

  @override
  Map<String, String> toJson(IUser user) {
    return {
      _id: id,
      _firstName: firstName,
    };
  }

  factory User.fromJson(Map<dynamic, dynamic> data) {
    return User(
      id: data[_id].toString(),
      firstName: data[_firstName],
    );
  }

  @override
  final String id;

  @override
  final String firstName;
}
