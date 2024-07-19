import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class BackAppBar extends StatelessWidget {
  const BackAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 361.w,
      child: GestureDetector(
        onTap: context.pop,
        child: Row(
          children: [
            Image.asset(
              'assets/png/icons/back.png',
              width: 24.w,
              height: 24.h,
            ),
            Gap(4.w),
            Text(
              title,
              style: AppTextStyles.medium19.copyWith(color: AppTheme.red),
            ),
          ],
        ),
      ),
    );
  }
}
