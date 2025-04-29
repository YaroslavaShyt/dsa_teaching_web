import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class AddLessonButton extends StatelessWidget {
  const AddLessonButton({
    required this.onTap,
    required this.isAdding,
    super.key,
  });

  final VoidCallback onTap;
  final bool isAdding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        child: MainContainer(
          padding: const EdgeInsetsDirectional.all(10),
          content: Row(
            spacing: 10,
            children: [
              Text(
                !isAdding ? "Нова лекція" : "Відміна",
              ),
              Icon(
                !isAdding ? Icons.add : Icons.close,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
