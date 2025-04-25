import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

import '../main_shadow.dart';

class MainTabBar extends StatelessWidget {
  const MainTabBar({
    required this.tabBarContent,
    required this.tabs,
    this.initialIndex = 0,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelStyle,
    this.margin,
    this.textTabBarHeight,
    super.key,
  });

  final int initialIndex;
  final List<Widget> tabBarContent;
  final List<Tab> tabs;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? margin;
  final double? textTabBarHeight;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);
    return DefaultTabController(
      initialIndex: initialIndex,
      length: tabs.length,
      child: Container(
        margin: margin ?? const EdgeInsetsDirectional.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: textTabBarHeight ?? 46,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.4,
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
                borderRadius: BorderRadius.circular(10),
                color: colorScheme.onSurface.withValues(alpha: 0.3),
                boxShadow: [mainBoxShadow(context)],
              ),
              margin: const EdgeInsetsDirectional.only(bottom: 16),
              child: TabBar(
                dividerColor: Colors.transparent,
                splashBorderRadius: BorderRadius.circular(10),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  boxShadow: [mainBoxShadow(context)],
                  borderRadius: BorderRadius.circular(10),
                  color: colorScheme.surface,
                  border: Border.all(
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                    width: 1.6,
                  ),
                ),
                labelStyle: labelStyle ??
                    textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                unselectedLabelColor:
                    unselectedLabelColor ?? colorScheme.onSurface,
                labelColor: labelColor ?? colorScheme.onSurface,
                tabs: tabs,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: TabBarView(
                children: tabBarContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
