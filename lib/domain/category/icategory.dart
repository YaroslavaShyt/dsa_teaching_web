import 'package:dsa_teaching_web/domain/topic/itopic.dart';

abstract interface class ICategory {
  ICategory({
    required this.title,
    required this.topics,
  });

  final String title;
  final List<ITopic> topics;
}
