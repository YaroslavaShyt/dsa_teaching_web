import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/domain/user/iuser.dart';
import 'package:flutter/material.dart';

class UserListTable extends StatelessWidget {
  const UserListTable({
    super.key,
    required this.users,
    required this.onUserSelected,
    required this.selectedId,
  });

  final List<IUser> users;
  final void Function(int) onUserSelected;
  final int? selectedId;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return DataTable(
      columns: const [
        DataColumn(label: Text('Імʼя')),
        DataColumn(label: Text('Email')),
        DataColumn(label: Text('Дата реєстрації')),
      ],
      rows: users.map(
        (user) {
          final bool isSelected = selectedId.toString() == user.id;
          final int userId = int.parse(user.id);

          return DataRow(
            color: isSelected
                ? WidgetStatePropertyAll(
                    colorScheme.onSurface.withValues(alpha: 0.4),
                  )
                : null,
            mouseCursor: WidgetStatePropertyAll(SystemMouseCursors.click),
            cells: [
              DataCell(
                Text(user.firstName),
                onTap: () => onUserSelected(userId),
              ),
              DataCell(
                Text(user.email),
                onTap: () => onUserSelected(userId),
              ),
              DataCell(
                Text(user.createdAt),
                onTap: () => onUserSelected(userId),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
