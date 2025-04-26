import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:dsa_teaching_web/presentation/initial/home/widgets/topics_list.dart';
import 'package:flutter/material.dart';

const String dataStructures = 'DATA_STRUCTURES';
const String algorithms = 'ALGORITHMS';

class CourseList extends StatelessWidget {
  const CourseList({
    required this.category,
    required this.onTap,
    super.key,
  });

  final ICategory category;
  final void Function(ICategory, ITopic) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.title == algorithms
              ? "Алгоритми"
              : category.title == dataStructures
                  ? "Структури даних"
                  : category.title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
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
