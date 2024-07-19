import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({super.key, required this.level});

  final Level level;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      height: 207.h,
      decoration: BoxDecoration(
        color: level.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: level.bottom,
            right: level.right,
            child: Image.asset(
              level.image,
              width: level.imageWidth,
              height: level.imageHeight,
            ),
          ),
          Positioned.fill(
            top: 16.h,
            left: 16.w,
            bottom: 16.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(level.name, style: AppTextStyles.bold36),
                Text(
                  level.description,
                  style: AppTextStyles.regular17.copyWith(
                    color: AppTheme.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
