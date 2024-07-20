import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.tag,
    this.onTap,
    this.selected = false,
  });

  final bool selected;
  final Tag tag;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.sp, color: AppTheme.red2),
          color: selected ? AppTheme.lightRed : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 5.5.h,
        ),
        child: Text(
          tag.tag,
          style: AppTextStyles.medium15.copyWith(
            color: selected ? null : AppTheme.red2,
          ),
        ),
      ),
    );
  }
}
