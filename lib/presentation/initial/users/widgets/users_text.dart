import 'package:flutter/material.dart';

class UsersText extends StatelessWidget {
  const UsersText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Користувачі",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30,
      ),
    );
  }
}
