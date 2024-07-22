import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 361.w,
        height: 180.h,
        decoration: BoxDecoration(
          color: AppTheme.white4,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Are you sure you want to leave without saving?",
                  style: AppTextStyles.bold22.copyWith(color: AppTheme.black2),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton2(
                  width: 160.w,
                  text: "Exit",
                  color: AppTheme.red,
                  textColor: AppTheme.white,
                  onTap: () => Navigator.of(context).pop(true),
                ),
                CustomButton2(
                  width: 160.w,
                  text: "Cancel",
                  onTap: () => Navigator.of(context).pop(false),
                ),
              ],
            ),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
