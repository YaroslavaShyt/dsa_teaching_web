import 'package:dsa_teaching_web/presentation/initial/widgets/buttons/main_outlined_button.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 50,
        ),
        child: MainOutlinedButton(
          width: 200,
          onPressed: onPressed,
          child: Text(
            "Зберегти",
            style: TextStyle(
              color: Colors.yellow,
            ),
          ),
        ),
      ),
    );
  }
}
