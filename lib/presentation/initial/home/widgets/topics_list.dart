import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:flutter/material.dart';

class TopicsList extends StatefulWidget {
  const TopicsList({
    required this.topic,
    required this.onTap,
    super.key,
  });

  final ITopic topic;
  final VoidCallback onTap;

  @override
  State<TopicsList> createState() => _TopicsListState();
}

class _TopicsListState extends State<TopicsList> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.topic.title,
          style: TextStyle(
            color:
                _isHovered ? colorScheme.primaryFixed : colorScheme.onSurface,
            decoration:
                _isHovered ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
