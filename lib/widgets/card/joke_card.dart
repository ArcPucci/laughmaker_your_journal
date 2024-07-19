import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329.w,
      height: 50.h,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name of Jokes",
            style: AppTextStyles.medium15,
          ),
          Text(
            "TEACHER: Glenn, how do you spell 'crocodile?' GLENN: -Ov",
            style: AppTextStyles.medium13,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
