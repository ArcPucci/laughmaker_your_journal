import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class QuoteCard extends StatelessWidget {
  QuoteCard({super.key, required this.quote});

  final Quote quote;

  final List<LinearGradient> gradients = [
    AppTheme.redGradient,
    AppTheme.greenGradient,
    AppTheme.orangeGradient,
  ];

  @override
  Widget build(BuildContext context) {
    final index = quote.id % 3;
    return Container(
      width: 361.w,
      decoration: BoxDecoration(
        gradient: gradients[index],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.asset(
            'assets/png/micro2.png',
            width: 144.w,
            height: 159.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/png/icons/apostrophe.png',
                  width: 24.w,
                  height: 19.h,
                ),
                Gap(16.h),
                Text(
                  quote.content,
                  style: AppTextStyles.bold22.copyWith(color: AppTheme.white),
                ),
                Gap(16.h),
                Text(quote.author, style: AppTextStyles.regular22),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
