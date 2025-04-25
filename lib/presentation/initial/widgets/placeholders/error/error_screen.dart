import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/animation_assets.dart';
import '../../../../../core/utils/theme/app_color_theme.dart';
import '../../../../../core/utils/theme/text_theme.dart';
import '../../buttons/main_outlined_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LottieBuilder.asset(
            LottieAssets.error,
          ),
          Text(
            'somethingWentWrong',
            style: getTextTheme(context).bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          MainOutlinedButton(
            onPressed: onTap,
            child: Text(
              'tryAgain',
              style: getTextTheme(context).bodyMedium?.copyWith(
                    color: getColorScheme(context).primaryFixed,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
