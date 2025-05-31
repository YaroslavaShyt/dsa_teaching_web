import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/add_image_button.dart';
import 'package:flutter/material.dart';

class LessonTheory extends StatelessWidget {
  const LessonTheory({
    required this.onPickImage,
    required this.onRemoveImage,
    required this.theory1Controller,
    required this.theoryImage1Url,
    required this.theory2Controller,
    required this.theoryImage2Url,
    required this.theory3Controller,
    required this.theoryImage3Url,
    required this.theory4Controller,
    required this.theoryImage4Url,
    super.key,
  });

  final void Function(int) onPickImage;
  final void Function(int) onRemoveImage;
  final TextEditingController theory1Controller;
  final String? theoryImage1Url;
  final TextEditingController theory2Controller;
  final String? theoryImage2Url;
  final TextEditingController theory3Controller;
  final String? theoryImage3Url;
  final TextEditingController theory4Controller;
  final String? theoryImage4Url;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Теорія",
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        _buildStep(1, theory1Controller, theoryImage1Url),
        _buildStep(2, theory2Controller, theoryImage2Url),
        _buildStep(3, theory3Controller, theoryImage3Url),
        _buildStep(4, theory4Controller, theoryImage4Url),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildStep(
    int index,
    TextEditingController controller,
    String? file,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          maxLines: null,
        ),
        AddImageButton(
          onTap: () => onPickImage(index),
          currentFile: file,
          remove: () => onRemoveImage(index),
        ),
      ],
    );
  }
}
