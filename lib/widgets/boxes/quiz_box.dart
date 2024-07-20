import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/buttons/custom_button_1.dart';

class QuizBox extends StatelessWidget {
  const QuizBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      height: 445.h,
      decoration: BoxDecoration(
        color: AppTheme.red2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 24.h,
            child: Image.asset(
              'assets/png/bg3.png',
              width: 347.w,
              height: 415.h,
            ),
          ),
          Positioned(
            top: 24.h,
            right: 73.w,
            left: 73.w,
            child: Image.asset(
              'assets/png/quiz.png',
              width: 215.w,
              height: 56.h,
            ),
          ),
          Positioned(
            right: 16.w,
            bottom: 16.h,
            child: CustomButton1(
              text: 'Play now',
              textStyle: AppTextStyles.medium17.copyWith(color: AppTheme.red),
              onTap: () => context.go('/library/levels'),
            ),
          ),
        ],
      ),
    );
  }
}
