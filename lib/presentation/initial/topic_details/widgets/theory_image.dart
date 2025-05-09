import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class TheoryImage extends StatelessWidget {
  const TheoryImage({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    if (image.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsetsDirectional.symmetric(vertical: 10),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Image.network(
          image,
          height: 300,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (frame == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              );
            }
            return child;
          },
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.error,
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            );
          },
        ),
      ),
    );
  }
}
