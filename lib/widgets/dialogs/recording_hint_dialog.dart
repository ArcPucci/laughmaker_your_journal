import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class RecordingsHintDialog extends StatelessWidget {
  const RecordingsHintDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 16.w,
          bottom: 76.h,
          child: SafeArea(
            top: false,
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Material(
                color: Colors.transparent,
                child: Row(
                  children: [
                    CustomIconButton(
                      icon: 'sound',
                      size: 44.r,
                      iconSize: 36.r,
                    ),
                    Gap(16.w),
                    Text(
                      "List of your audio\nrecordings in this note",
                      style: AppTextStyles.medium15.copyWith(
                        color: AppTheme.white,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
