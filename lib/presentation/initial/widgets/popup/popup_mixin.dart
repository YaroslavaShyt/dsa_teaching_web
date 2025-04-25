import 'package:dsa_teaching_web/presentation/initial/widgets/popup/popup.dart';
import 'package:flutter/material.dart';

mixin PopUpMixin {
  void showPopup({
    required BuildContext context,
    Widget? child,
    VoidCallback? onTapOutside,
    VoidCallback? onPositivePressed,
    VoidCallback? onNegativePressed,
    double height = 200,
    double? width,
  }) {
    PopUp.show(
      height: height,
      width: width,
      context: context,
      onTapOutside: onTapOutside,
      child: child,
      onNegativePressed: onNegativePressed,
      onPositivePressed: onPositivePressed,
    );
  }
}
