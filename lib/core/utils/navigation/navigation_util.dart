import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:flutter/material.dart';

class NavigationUtil implements INavigationUtil {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  bool get canPop {
    return navigatorKey.currentState!.canPop();
  }

  @override
  void navigateBack({data, int pagesNum = 1}) {
    for (int i = 0; i < pagesNum; i++) {
      navigatorKey.currentState!.pop(data);
    }
  }

  @override
  void navigateBackToStart() {
    while (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
  }

  @override
  void navigateBackUntilNamed(String named) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(named));
  }

  @override
  Future navigateTo<T extends Object?>(
    String routeName, {
    bool allowBackNavigation = true,
    dynamic data,
  }) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: data);
  }

  @override
  Future navigateToAndMakeRoot<T extends Object?>(
    String routeName, {
    dynamic data,
    bool allowBackNavigation = true,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => allowBackNavigation ? false : true,
      arguments: data,
    );
  }

  @override
  Future navigateToAndReplace<T extends Object?>(
    String routeName, {
    dynamic data,
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: data,
    );
  }
}
