import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:dsa_teaching_web/presentation/initial/home/bloc/home_state.dart';
import 'package:dsa_teaching_web/presentation/initial/home/widgets/topics_list.dart';
import 'package:flutter/material.dart';

const String dataStructures = 'DATA_STRUCTURES';
const String algorithms = 'ALGORITHMS';

class CourseList extends StatelessWidget {
  const CourseList({
    required this.category,
    required this.onTap,
    required this.onAddPressed,
    required this.addCategoryStatus,
    required this.delete,
    required this.onEdit,
    super.key,
  });

  final ICategory category;
  final void Function(ICategory, ITopic) onTap;
  final VoidCallback onAddPressed;
  final AddCategoryStatus addCategoryStatus;
  final void Function(int) delete;
  final void Function(ITopic, int) onEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10,
          children: [
            Text(
              category.title == algorithms
                  ? "Алгоритми"
                  : category.title == dataStructures
                      ? "Структури даних"
                      : category.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
          ],
        ),
        Text(
          'Теми:',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 8,
          ),
          child: Column(
            children: [
              ...category.topics.map(
                (topic) {
                  return Row(
                    spacing: 10,
                    children: [
                      Text('${category.topics.indexOf(topic) + 1}.'),
                      TopicsList(
                        topic: topic,
                        onTap: () => onTap(category, topic),
                        onDelete: () => delete(topic.id!),
                        onEdit: () => onEdit(topic, category.id),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
