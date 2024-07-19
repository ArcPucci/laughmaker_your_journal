import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    this.onTap,
    this.width,
    this.height,
    required this.text,
    this.textStyle,
  });

  final String text;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 142.w,
        height: height ?? 46.h,
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style:
              textStyle ?? AppTextStyles.bold17.copyWith(color: AppTheme.black),
        ),
      ),
    );
  }
}
