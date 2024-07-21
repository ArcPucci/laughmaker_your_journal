import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/tag_widget.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    super.key,
    this.onTap,
    required this.tags,
    required this.joke,
    this.hasBorder = true,
  });

  final Joke joke;
  final List<Tag> tags;
  final VoidCallback? onTap;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 329.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                top: hasBorder
                    ? BorderSide(
                        width: 0.5.sp,
                        color: AppTheme.grey4,
                      )
                    : BorderSide.none,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(4.h),
                Text(
                  joke.title,
                  style: AppTextStyles.medium15,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(4.h),
                Text(
                  joke.content,
                  style: AppTextStyles.medium13,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(4.h),
                SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Row(
                    children: List.generate(
                      tags.length,
                      (index) {
                        final tag = tags[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: TagWidget(tag: tag, selected: true),
                        );
                      },
                    ),
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
