import 'package:dsa_teaching_web/presentation/initial/home/bloc/home_state.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class AddTopicButton extends StatelessWidget {
  const AddTopicButton({
    required this.onTap,
    required this.status,
    super.key,
  });

  final VoidCallback onTap;
  final AddCategoryStatus status;

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
                status == AddCategoryStatus.initial ? "Нова тема" : "Відміна",
              ),
              Icon(
                status == AddCategoryStatus.initial ? Icons.add : Icons.close,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
