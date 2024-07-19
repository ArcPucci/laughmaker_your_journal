import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.size,
    this.iconSize,
    this.onTap,
    required this.icon,
  });

  final double? size;
  final double? iconSize;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size ?? 34.r,
        height: size ?? 34.r,
        decoration: BoxDecoration(
          color: AppTheme.red,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/png/icons/$icon.png",
          width: iconSize ?? 26.r,
          height: iconSize ?? 26.r,
        ),
      ),
    );
  }
}
