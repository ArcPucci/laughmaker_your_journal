import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/card/joke_card.dart';

class JokesListCard extends StatelessWidget {
  const JokesListCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 361.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.medium19),
          Gap(8.h),
          Container(
            width: 361.w,
            decoration: BoxDecoration(
              color: AppTheme.grey2,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Column(
              children: List.generate(
                3,
                (index) {
                  return const JokeCard();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
