import 'package:dsa_teaching_web/domain/user/iuser.dart';
import 'package:flutter/material.dart';

class UserListTable extends StatelessWidget {
  const UserListTable({
    super.key,
    required this.users,
  });

  final List<IUser> users;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Імʼя')),
        DataColumn(label: Text('Email')),
        DataColumn(label: Text('Дата реєстрації')),
      ],
      rows: users.map(
        (user) {
          return DataRow(
            cells: [
              DataCell(Text(user.firstName)),
              DataCell(Text(user.email)),
              DataCell(Text(user.createdAt)),
            ],
          );
        },
      ).toList(),
    );
  }
}
