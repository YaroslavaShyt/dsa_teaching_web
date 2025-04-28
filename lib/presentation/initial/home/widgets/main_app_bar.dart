import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    required this.userName,
    required this.onExitTap,
    super.key,
  });

  final String userName;
  final VoidCallback onExitTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Row(
              spacing: 10,
              children: [
                Icon(Icons.person, color: Colors.white),
                Text(userName),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "Панель адміністрування",
                style: getTextTheme(context).labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20,
                    ),
              ),
              Text(
                '  DSA Teaching',
                style: getTextTheme(context).labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: getColorScheme(context).primaryFixed,
                      fontSize: 20,
                    ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 20),
            child: IconButton(
              onPressed: onExitTap,
              icon: Icon(Icons.logout_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
