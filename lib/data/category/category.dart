import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';

class Category implements ICategory {
  Category({
    required this.id,
    required this.title,
    required this.topics,
  });

  @override
  final int id;

  @override
  final String title;

  @override
  final List<ITopic> topics;
}
