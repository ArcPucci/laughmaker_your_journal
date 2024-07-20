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
  });

  final List<Tag> tags;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 329.w,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(4.h),
                Text(
                  "Name of Jokes",
                  style: AppTextStyles.medium15,
                ),
                Gap(4.h),
                Text(
                  "TEACHER: Glenn, how do you spell 'crocodile?' GLENN: -Ov",
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
