import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class RecordingCard extends StatelessWidget {
  const RecordingCard({
    super.key,
    required this.index,
    this.onPlay,
    this.onDelete,
    this.playing = false,
  });

  final int index;
  final bool playing;
  final VoidCallback? onPlay;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${index + 1}.',
          style: AppTextStyles.medium17.copyWith(color: AppTheme.black),
        ),
        Gap(16.w),
        Text(
          '28.07.2024',
          style: AppTextStyles.medium17.copyWith(color: AppTheme.black),
        ),
        Gap(16.w),
        Text(
          '03:57',
          style: AppTextStyles.medium17.copyWith(color: AppTheme.black),
        ),
        Spacer(),
        GestureDetector(
          onTap: onPlay,
          child: Image.asset(
            playing ? 'assets/png/icons/stop.png' : 'assets/png/icons/play.png',
            width: 24.w,
            height: 24.h,
            color: playing ? AppTheme.red : null,
          ),
        ),
        Gap(24.w),
        GestureDetector(
          onTap: onDelete,
          child: Image.asset(
            'assets/png/icons/trash.png',
            width: 24.w,
            height: 24.h,
            color: AppTheme.red,
          ),
        ),
      ],
    );
  }
}
