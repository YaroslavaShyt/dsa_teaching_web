import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({
    required this.onTap,
    required this.remove,
    this.currentFile,
    super.key,
  });

  final VoidCallback onTap;
  final String? currentFile;
  final VoidCallback remove;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    if (currentFile == null) {
      return Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
        child: GestureDetector(
          onTap: onTap,
          child: MouseRegion(
            child: MainContainer(
              width: 200,
              height: 50,
              padding: const EdgeInsetsDirectional.all(10),
              content: Row(
                spacing: 10,
                children: [
                  Text(
                    "Додати зображення",
                  ),
                  Icon(
                    Icons.image_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    if (currentFile != null) {
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
        child: ClipRect(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Image.network(
                currentFile!,
                height: 300,
                width: MediaQuery.sizeOf(context).width / 3,
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
              IconButton(
                onPressed: remove,
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }
}
