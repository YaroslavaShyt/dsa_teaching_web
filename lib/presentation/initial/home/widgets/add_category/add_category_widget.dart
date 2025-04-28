import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:dsa_teaching_web/presentation/initial/home/widgets/course_list.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/editable_info/save_button.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class AddCategoryWidget extends StatefulWidget {
  const AddCategoryWidget({
    required this.categories,
    required this.save,
    this.topic,
    this.categoryId,
    super.key,
  });

  final int? categoryId;
  final ITopic? topic;
  final List<ICategory> categories;
  final void Function(String, int, bool, int?) save;

  @override
  State<AddCategoryWidget> createState() => _AddCategoryWidgetState();
}

class _AddCategoryWidgetState extends State<AddCategoryWidget> {
  late TextEditingController titleController;
  late int selectedId;

  @override
  void initState() {
    super.initState();
    selectedId = widget.categoryId ?? widget.categories.first.id;
    titleController = TextEditingController(text: widget.topic?.title);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return Flexible(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height - 100,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainContainer(
                padding: const EdgeInsetsDirectional.all(10),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Категорія",
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    DropdownButton<int>(
                      value: selectedId,
                      iconEnabledColor: Colors.white,
                      items: widget.categories
                          .map<DropdownMenuItem<int>>(
                            (element) => DropdownMenuItem(
                              value: element.id,
                              child: Text(
                                element.title == dataStructures
                                    ? 'Структури даних'
                                    : 'Алгоритми',
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => _onChanged(value as int),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Назва теми",
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextFormField(controller: titleController),
                    const SizedBox(height: 20),
                    SaveButton(
                      onPressed: () => widget.save(
                        titleController.text,
                        selectedId,
                        widget.topic != null,
                        widget.topic?.id,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChanged(int id) {
    setState(() {
      selectedId = id;
    });
  }
}
