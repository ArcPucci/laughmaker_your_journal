import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/dialogs/tags_dialog.dart';

class TagsRow extends StatelessWidget {
  const TagsRow({
    super.key,
    required this.tags,
    required this.onSelect,
  });

  final List<String> tags;
  final void Function(Tag) onSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(),
        ),
        if (tags.isEmpty)
          Text(
            "Add tag",
            style: AppTextStyles.medium19.copyWith(color: AppTheme.red2),
          ),
        Gap(16.w),
        GestureDetector(
          onTap: () => onMore(context),
          child: Image.asset(
            'assets/png/icons/more.png',
            width: 24.w,
            height: 24.h,
          ),
        ),
        Gap(16.w),
      ],
    );
  }

  void onMore(BuildContext context) async {
    await showDialog(
      context: context,
      useSafeArea: true,
      barrierColor: AppTheme.darkRed.withOpacity(0.62),
      builder: (context) {
        return Column(
          children: [
            Gap(128.h),
            TagsDialog(),
          ],
        );
      },
    );
  }
}
