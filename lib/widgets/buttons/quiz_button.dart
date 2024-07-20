import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.text,
    this.onTap,
    this.selected = false,
    this.correct = false,
    this.checked = false,
  });

  final String text;
  final bool selected;
  final bool correct;
  final bool checked;
  final VoidCallback? onTap;

  Border? getBorder() {
    if (checked && selected) {
      if (correct) {
        return Border.all(
          width: 3.sp,
          color: AppTheme.green,
        );
      }

      return Border.all(
        width: 3.sp,
        color: AppTheme.red,
      );
    }
    if (selected) {
      return Border.all(
        width: 3.sp,
        color: AppTheme.greenAccent,
      );
    }
    return null;
  }

  Color getColor() {
    if (checked && selected) {
      if (correct) return AppTheme.lightGreen;
      return AppTheme.lightRed;
    }

    return AppTheme.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 329.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: getColor(),
          border: getBorder(),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Text(text, style: AppTextStyles.medium19),
      ),
    );
  }
}
