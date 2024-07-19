import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class QuotesAndJokesBox extends StatelessWidget {
  const QuotesAndJokesBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/library/quotes'),
      child: Container(
        width: 361.w,
        height: 136.h,
        decoration: BoxDecoration(
          color: AppTheme.red,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quotes and jokes for inspiration",
              style: AppTextStyles.bold25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Read",
                  style: AppTextStyles.medium17.copyWith(
                    color: AppTheme.white,
                  ),
                ),
                Image.asset(
                  'assets/png/icons/next.png',
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
