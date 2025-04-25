import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/animated_gestures/tap_animated_widget.dart';
import 'package:flutter/material.dart';

class MainOutlinedButton extends StatelessWidget {
  const MainOutlinedButton({
    required this.onPressed,
    required this.child,
    this.width = double.infinity,
    this.height = 55,
    this.isActive = true,
    this.color,
    super.key,
  });

  final bool isActive;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    return TapAnimatedWidget(
      onTap: onPressed,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: WidgetStateProperty.all(
            BorderSide(
              color: color ??
                  (isActive
                      ? colorScheme.primaryFixed
                      : colorScheme.onSurface.withValues(alpha: 0.3)),
              width: 4.0,
            ),
          ),
          elevation: WidgetStateProperty.all(15.0),
          shadowColor: WidgetStateProperty.all(colorScheme.shadow),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
