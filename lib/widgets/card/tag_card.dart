import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class TagCard extends StatelessWidget {
  const TagCard({
    super.key,
    required this.tag,
    this.onTap,
    this.onDelete,
  });

  final Tag tag;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 9.w),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1.sp, color: AppTheme.red2),
                  color: Colors.transparent,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 5.5.h,
                ),
                child: Text(
                  tag.tag,
                  style: AppTextStyles.medium15.copyWith(color: AppTheme.red2),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onDelete,
              child: Image.asset(
                'assets/png/icons/close.png',
                width: 18.w,
                height: 18.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
