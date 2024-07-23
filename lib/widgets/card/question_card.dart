import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.answers,
    required this.onAnswer,
    required this.quote,
    this.state = ButtonState.idle,
    this.selected = -1,
  });

  final Quote quote;
  final List<String> answers;
  final void Function(int) onAnswer;
  final ButtonState state;
  final int selected;

  @override
  Widget build(BuildContext context) {
    final checked = state == ButtonState.correct || state == ButtonState.wrong;
    return Container(
      width: 361.w,
      height: 540.h,
      decoration: BoxDecoration(
        color: AppTheme.white3,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      child: Column(
        children: [
          Text(
            "Who told this joke?",
            style: AppTextStyles.bold25.copyWith(color: AppTheme.red2),
          ),
          Gap(32.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/png/icons/apostrophe.png',
              width: 28.w,
              height: 22.h,
              color: AppTheme.red2,
            ),
          ),
          Gap(8.h),
          Expanded(
            child: Center(child: AutoSizeText(quote.content, style: AppTextStyles.medium24)),
          ),
          Gap(8.h),
          Column(
            children: List.generate(
              answers.length,
              (index) {
                final correct = quote.author == answers[index];
                return Padding(
                  padding: EdgeInsets.only(top: index != 0 ? 12.h : 0),
                  child: QuizButton(
                    text: answers[index],
                    selected: index == selected,
                    checked: checked,
                    correct: correct,
                    onTap: () => onAnswer(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
