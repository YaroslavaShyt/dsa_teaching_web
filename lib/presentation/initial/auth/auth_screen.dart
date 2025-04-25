import 'package:dsa_teaching_web/core/utils/theme/app_color_theme.dart';
import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/buttons/main_outlined_button.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/input/main_text_field.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/lottie_animations/robot_animation.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Scaffold(
      body: Center(
        child: Container(
          // color: Colors.orange,
          child: Padding(
            padding: const EdgeInsetsDirectional.all(18),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'DSA Teaching',
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.primaryFixed,
                      fontWeight: FontWeight.w700,
                      fontSize: 50,
                    ),
                  ),
                  Text(
                    'Керуйте навчальними матеріалами швидко та легко!',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  RobotAnimation(
                    height: 500,
                    width: 450,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width / 20,
                    ),
                    child: MainContainer(
                      padding: const EdgeInsetsDirectional.all(20),
                      content: Column(
                        spacing: 28,
                        children: [
                          MainTextField(
                            labelText: 'Логін',
                          ),
                          MainTextField(
                            labelText: 'Пароль',
                            obscureText: true,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 100,
                            ),
                            child: MainOutlinedButton(
                              onPressed: () {},
                              child: Text('Увійти'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
