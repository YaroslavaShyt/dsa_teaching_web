import 'package:dsa_teaching_web/domain/user/iuser_learned_lessons.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class UserLearningInfoWidget extends StatelessWidget {
  const UserLearningInfoWidget({
    required this.lessons,
    required this.onClosePressed,
    super.key,
  });

  final List<IUserLearnedLessons> lessons;
  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 600,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainContainer(
                padding: const EdgeInsetsDirectional.all(4),
                content: IconButton(
                  onPressed: onClosePressed,
                  icon: Icon(
                    Icons.close,
                  ),
                ),
              ),
            ],
          ),
        ),
        DataTable(
          columns: const [
            DataColumn(label: Text('Модуль')),
            DataColumn(label: Text('Витрачений час')),
            DataColumn(label: Text('Дата проходження')),
          ],
          rows: lessons.map(
            (lesson) {
              return DataRow(
                cells: [
                  DataCell(
                    SizedBox(
                      width: 200,
                      child: Text(
                        lesson.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: 200,
                      child: Text(
                        '${(lesson.timeSpent / 60).ceilToDouble()} хвилин',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataCell(
                    SizedBox(
                      width: 200,
                      child: Text(
                        lesson.date,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
