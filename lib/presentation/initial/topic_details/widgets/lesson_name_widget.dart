import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class LessonNameWidget extends StatefulWidget {
  const LessonNameWidget({
    required this.lesson,
    required this.onTap,
    required this.isSelected,
    super.key,
  });

  final ILesson lesson;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  State<LessonNameWidget> createState() => _LessonNameWidgetState();
}

class _LessonNameWidgetState extends State<LessonNameWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return MainContainer(
      padding: const EdgeInsetsDirectional.all(16),
      color: widget.isSelected
          ? colorScheme.onSurface.withValues(alpha: 0.3)
          : colorScheme.surface,
      content: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Text(
            widget.lesson.title,
            style: TextStyle(
              color:
                  _isHovered ? colorScheme.primaryFixed : colorScheme.onSurface,
              decoration:
                  _isHovered ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
