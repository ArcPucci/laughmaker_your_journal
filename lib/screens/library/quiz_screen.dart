import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Consumer<QuizProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            Gap(20.h),
            Stack(
              alignment: Alignment.center,
              children: [
                BackAppBar(title: "Library", onBack: () => onQuit(context)),
                Text(
                  '${value.currentIndex}/${value.total}',
                  style: AppTextStyles.bold28,
                ),
              ],
            ),
            Gap(12.h),
            CustomIndicator(total: value.total, current: value.currentIndex),
            Gap(32.h),
            QuestionCard(
              quote: value.quote,
              answers: value.answers,
              onAnswer: value.onAnswer,
              selected: value.selectedIndex,
              state: value.buttonState,
            ),
            Spacer(),
            Container(
              width: 361.w,
              alignment: Alignment.centerRight,
              child: CheckButton(
                buttonState: value.buttonState,
                onTap: value.onCheck,
              ),
            ),
            Gap(24.h + overlay.bottom),
          ],
        );
      },
    );
  }

  void onQuit(BuildContext context) async {
    final quit = await showCupertinoModalPopup(
      context: context,
      barrierColor: AppTheme.darkRed.withOpacity(0.62),
      builder: (context) {
        return QuitSheet();
      },
    );

    if (!(quit ?? false)) return;
    context.pop();
  }
}
