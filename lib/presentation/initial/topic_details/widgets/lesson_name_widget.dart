import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/domain/lesson/ilesson.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/bloc/topic_details_state.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class LessonNameWidget extends StatefulWidget {
  const LessonNameWidget({
    required this.lesson,
    required this.onTap,
    required this.isSelected,
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.mode,
    super.key,
  });

  final ILesson lesson;
  final VoidCallback onTap;
  final bool isSelected;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;
  final Mode mode;

  @override
  State<LessonNameWidget> createState() => _LessonNameWidgetState();
}

class _LessonNameWidgetState extends State<LessonNameWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Row(
        spacing: 10,
        children: [
          MainContainer(
            padding: const EdgeInsetsDirectional.all(16),
            color: widget.isSelected
                ? colorScheme.onSurface.withValues(alpha: 0.3)
                : colorScheme.surface,
            content: GestureDetector(
              onTap: widget.onTap,
              child: Text(
                widget.lesson.title,
                style: TextStyle(
                  color: _isHovered
                      ? colorScheme.primaryFixed
                      : colorScheme.onSurface,
                  decoration: _isHovered
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),
          ),
          if (_isHovered || widget.isSelected)
            Row(
              spacing: 10,
              children: [
                MainContainer(
                  padding: const EdgeInsetsDirectional.all(4),
                  content: IconButton(
                    onPressed: widget.onEditPressed,
                    icon: Icon(
                      widget.mode == Mode.read || widget.mode == Mode.initial
                          ? Icons.edit
                          : Icons.close,
                    ),
                  ),
                ),
                MainContainer(
                  padding: const EdgeInsetsDirectional.all(4),
                  content: IconButton(
                    onPressed: widget.onDeletePressed,
                    icon: Icon(
                      Icons.delete_rounded,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
