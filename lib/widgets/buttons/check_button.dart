import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

enum ButtonState { selected, idle, correct, wrong }

class CheckButton extends StatelessWidget {
  const CheckButton({
    super.key,
    this.onTap,
    this.buttonState = ButtonState.idle,
  });

  final ButtonState buttonState;
  final VoidCallback? onTap;

  Color getBG() {
    if (buttonState == ButtonState.selected) return AppTheme.greenAccent;
    if (buttonState == ButtonState.correct) return AppTheme.green;
    if (buttonState == ButtonState.wrong) return AppTheme.red;

    return AppTheme.white3;
  }

  Color? getTextColor() {
    if (buttonState != ButtonState.idle) return AppTheme.white;

    return null;
  }

  String getText() {
    if (buttonState == ButtonState.idle || buttonState == ButtonState.selected)
      return "Check";
    return "Next";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 181.w,
        height: 54.h,
        decoration: BoxDecoration(
          color: getBG(),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          getText(),
          style: AppTextStyles.medium17.copyWith(color: getTextColor()),
        ),
      ),
    );
  }
}
