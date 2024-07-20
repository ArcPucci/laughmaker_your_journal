import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class CustomInput2 extends StatelessWidget {
  CustomInput2({super.key, this.controller});

  final TextEditingController? controller;

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: focusNode.requestFocus,
      child: Container(
        width: 329.w,
        height: 46.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.sp, color: AppTheme.red4),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: TextField(
          controller: controller,
          style: AppTextStyles.medium15.copyWith(color: AppTheme.black2),
          decoration: InputDecoration.collapsed(hintText: ''),
        ),
      ),
    );
  }
}
