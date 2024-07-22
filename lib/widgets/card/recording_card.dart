import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class RecordingCard extends StatelessWidget {
  const RecordingCard({
    super.key,
    required this.index,
    this.onPlay,
    this.onDelete,
    this.playing = false,
    required this.recording,
    required this.duration,
  });

  final int index;
  final bool playing;
  final int duration;
  final Recording recording;
  final VoidCallback? onPlay;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final timer = _getTimer(playing ? duration : recording.duration);
    return Row(
      children: [
        SizedBox(
          width: 24.w,
          child: Text(
            '${index + 1}.',
            style: AppTextStyles.medium17.copyWith(color: AppTheme.black),
          ),
        ),
        Gap(16.w),
        SizedBox(
          width: 100.w,
          child: Text(
            recording.created.fullFormat,
            style: AppTextStyles.medium17.copyWith(color: AppTheme.black),
          ),
        ),
        Gap(16.w),
        Text(
          timer,
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

  String _getTimer(int duration) {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;

    final text1 = minutes.toString().padLeft(2, '0');
    final text2 = seconds.toString().padLeft(2, '0');

    return '$text1:$text2';
  }
}
