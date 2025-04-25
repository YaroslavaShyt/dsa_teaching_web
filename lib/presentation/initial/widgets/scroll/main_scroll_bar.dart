import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScrollbar extends StatelessWidget {
  const MainScrollbar({
    required this.child,
    super.key,
    this.controller,
  });

  final ScrollController? controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 4),
      child: Platform.isIOS
          ? CupertinoScrollbar(
              thickness: 5,
              radius: const Radius.circular(20),
              controller: controller,
              child: child,
            )
          : Scrollbar(
              thickness: 5,
              controller: controller,
              radius: const Radius.circular(20),
              child: child,
            ),
    );
  }
}
