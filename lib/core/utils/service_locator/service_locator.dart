import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/core/utils/navigation/navigation_util.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    _initNavigation();
  }

  static void _initNavigation() {
    sl.registerSingleton<INavigationUtil>(NavigationUtil());
  }

  static void _initRepos() {}

  static void _initServices() {}
}
