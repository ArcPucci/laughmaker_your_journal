import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class TagsDialog extends StatelessWidget {
  const TagsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      decoration: BoxDecoration(
        color: AppTheme.white4,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: Navigator.of(context).pop,
            child: Text(
              "Cancel",
              style: AppTextStyles.medium17.copyWith(
                color: AppTheme.red3,
              ),
            ),
          ),
          Gap(7.h),
          Wrap(
            spacing: 13.w,
            runSpacing: 13.h,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              ...List.generate(
                5,
                (index) {
                  return TagCard(tag: Tag.empty());
                },
              ),
              GestureDetector(
                onTap: () => onCreateTag(context),
                child: Image.asset(
                  'assets/png/add_button.png',
                  width: 57.w,
                  height: 33.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onCreateTag(BuildContext context) async {
    await showDialog(
      context: context,
      barrierColor: AppTheme.darkRed.withOpacity(0.62),
      useSafeArea: true,
      builder: (context) {
        return Column(
          children: [
            Gap(198.h),
            NewTagDialog(),
          ],
        );
      },
    );
  }
}
