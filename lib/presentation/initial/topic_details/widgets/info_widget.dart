import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/theory/ilesson_theory.dart';
import 'package:dsa_teaching_web/presentation/initial/widgets/main_container.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    required this.theory,
    required this.game,
    super.key,
  });

  final ILessonTheory theory;
  final IGame game;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Flexible(
      child: Container(
        // color: Colors.green,
        height: MediaQuery.sizeOf(context).height - 100,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainContainer(
                width: double.infinity,
                padding: const EdgeInsetsDirectional.all(10),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      theory.lessonTitle,
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "План",
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Text("1. ${theory.lessonPlan.step1}"),
                    Text("2. ${theory.lessonPlan.step2}"),
                    Text("3. ${theory.lessonPlan.step3}"),
                    Text("4. ${theory.lessonPlan.step4}"),
                    SizedBox(height: 50),
                    Text(
                      "Теоретичний матеріал",
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      theory.lessonTheory.theoryStep1,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      theory.lessonTheory.theoryStep2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      theory.lessonTheory.theoryStep3,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Перевірка знань",
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    ...game.tasks.map(
                      (task) {
                        return Padding(
                          padding: const EdgeInsetsDirectional.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(bottom: 8),
                                child: Text(
                                  "${game.tasks.indexOf(task) + 1}. ${task.question}",
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              ...task.answerOptions.map(
                                (option) {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 8),
                                    child: Text(
                                      "${letters[task.answerOptions.indexOf(option)]}. $option",
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: option == task.correctAnswer
                                            ? FontWeight.w700
                                            : null,
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const String letters = 'abcdefghijklmopqrstuvwxyz';
