import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.onTap,
    this.width,
    this.height,
  });

  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 361.w,
        height: height ?? 54.h,
        decoration: BoxDecoration(
          color: color ?? AppTheme.grey2,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppTextStyles.medium17.copyWith(color: textColor),
        ),
      ),
    );
  }
}
