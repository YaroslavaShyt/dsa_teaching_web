import 'package:dsa_teaching_web/domain/topic/itopic.dart';

abstract interface class ICategory {
  ICategory({
    required this.id,
    required this.title,
    required this.topics,
  });

  final int id;
  final String title;
  final List<ITopic> topics;
}
