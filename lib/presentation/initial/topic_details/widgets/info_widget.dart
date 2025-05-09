import 'package:dsa_teaching_web/core/utils/theme/text_theme.dart';
import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/theory/ilesson_theory.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/game_task.dart';
import 'package:dsa_teaching_web/presentation/initial/topic_details/widgets/theory_image.dart';
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
      child: SizedBox(
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
                    TheoryImage(image: theory.lessonTheory.theoryImageStep1),
                    Text(
                      theory.lessonTheory.theoryStep2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    TheoryImage(image: theory.lessonTheory.theoryImageStep2),
                    Text(
                      theory.lessonTheory.theoryStep3,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    TheoryImage(image: theory.lessonTheory.theoryImageStep3),
                    Text(
                      theory.lessonTheory.theoryStep4,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    TheoryImage(image: theory.lessonTheory.theoryImageStep4),
                    SizedBox(height: 50),
                    Text(
                      "Перевірка знань. Час: ${game.timeLimit / 60} хв",
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    ...game.tasks.map(
                      (task) {
                        return GameTask(
                          game: game,
                          task: task,
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
