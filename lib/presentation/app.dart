import 'package:dsa_teaching_web/core/utils/navigation/inavigation_util.dart';
import 'package:dsa_teaching_web/core/utils/service_locator/service_locator.dart';
import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/presentation/initial/initial_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: ServiceLocator.cubitAsService,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: sl.get<INavigationUtil>().navigatorKey,
        theme: AppColorTheme.theme(context),
        home: InitialFactory.build(),
      ),
    );
  }
}
