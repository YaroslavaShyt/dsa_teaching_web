import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';

class Category implements ICategory {
  Category({
    required this.title,
    required this.topics,
  });

  @override
  final String title;

  @override
  final List<ITopic> topics;
}
