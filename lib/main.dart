import 'package:dsa_teaching_web/core/utils/service_locator/service_locator.dart';
import 'package:dsa_teaching_web/presentation/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.init();

  runApp(
    const App(),
  );
}
