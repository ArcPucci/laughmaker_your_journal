import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.total,
    required this.current,
  });

  final int total;
  final int current;

  @override
  Widget build(BuildContext context) {
    final width = 361.w * (current / total);
    return Container(
      width: 361.w,
      height: 12.h,
      decoration: BoxDecoration(
        color: AppTheme.white3,
        borderRadius: BorderRadius.circular(11),
      ),
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: width,
        height: 12.h,
        decoration: BoxDecoration(
          color: AppTheme.red2,
          borderRadius: BorderRadius.circular(11),
        ),
      ),
    );
  }
}
