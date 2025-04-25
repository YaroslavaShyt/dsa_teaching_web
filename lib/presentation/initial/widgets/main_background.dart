import 'package:flutter/material.dart';

import '../../../core/utils/theme/app_color_theme.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({
    this.scaleParam = 0.8,
    super.key,
  });

  final double scaleParam;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    return Container(
      height: MediaQuery.sizeOf(context).height * scaleParam,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.6,
          focal: Alignment.center,
          focalRadius: 0.0,
          colors: [
            colorScheme.onSurface.withValues(alpha: 0.5),
            colorScheme.surface.withValues(alpha: 0.3),
          ],
          stops: [0.0, 1.0],
        ),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
