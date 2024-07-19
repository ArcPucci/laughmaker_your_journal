import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class GuideCard extends StatelessWidget {
  const GuideCard({
    super.key,
    required this.guide,
    this.onTap,
  });

  final Guide guide;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 361.w,
        height: 188.h,
        decoration: BoxDecoration(
          color: guide.color,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 34.h,
              child: Image.asset(
                'assets/png/chairs.png',
                width: 203.w,
                height: 107.h,
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(guide.title, style: AppTextStyles.bold25),
                  Text(
                    guide.description,
                    maxLines: 2,
                    style: AppTextStyles.medium13.copyWith(
                      color: AppTheme.grey2,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Read more",
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
          ],
        ),
      ),
    );
  }
}
