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
    this.topic,
    super.key,
  });

  final ITopic? topic;
  final List<ICategory> categories;

  @override
  State<AddCategoryWidget> createState() => _AddCategoryWidgetState();
}

class _AddCategoryWidgetState extends State<AddCategoryWidget> {
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
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
                      value: widget.categories[0].id,
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
                      onChanged: (value) => {},
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
                      onPressed: () {},
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

  void _onChanged(int questionIndex, String? selectedKey) {
    setState(() {
      // correctAnswers[questionIndex] = selectedKey;
      //
      // final index = switch (selectedKey) {
      //   'a' => 1,
      //   'b' => 2,
      //   'c' => 3,
      //   'd' => 4,
      //   _ => 1,
      // };
      //
      // widget.gameControllers[questionIndex][5].text =
      //     widget.gameControllers[questionIndex][index].text;
    });
  }
}
