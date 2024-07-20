import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/buttons/custom_button_2.dart';
import 'package:provider/provider.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.red,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/lights.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Consumer<QuizProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return Column(
                    children: [
                      Gap(97.h),
                      Text(
                        getTitle(value.score),
                        style: AppTextStyles.pcRegular.copyWith(
                          fontSize: value.score < 6 ? 57.r : null,
                        ),
                      ),
                      Gap(12.h),
                      Image.asset(
                        'assets/png/micro4.png',
                        width: 122.w,
                        height: 265.h,
                      ),
                      Gap(31.h),
                      Text(
                        "Your score",
                        style: AppTextStyles.bold27.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Gap(16.h),
                      Text(
                        "${value.score}/${value.total}",
                        style: AppTextStyles.bold28.copyWith(
                          color: AppTheme.white,
                        ),
                      ),
                      Gap(16.h),
                      Text(
                        getText(value.score),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regular17.copyWith(
                          color: AppTheme.white,
                        ),
                      ),
                      Spacer(),
                      CustomButton2(
                        text: "Go to Library",
                        color: AppTheme.white,
                        textColor: AppTheme.red,
                        onTap: value.goToLibrary,
                      ),
                      Gap(24.h),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getTitle(int score) {
    if (score < 6) return "Don’t give up";

    return "Congrats";
  }

  String getText(int score) {
    if (score == 10)
      return "Well done!\nYou have an excellent result!\nTest your knowledge at other levels.";
    if (score >= 6) return "Well done!\nKeep learning to improve your score.";

    return "Keep learning!\nDon't miss the chance\nto improve your results.";
  }
}
