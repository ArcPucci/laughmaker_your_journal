import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onAdd,
    this.hasEdit = false,
  });

  final String title;
  final bool hasEdit;
  final VoidCallback? onAdd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 361.w,
      child: Row(
        children: [
          CustomIconButton(
            icon: 'settings',
            onTap: () {
              if(!Scaffold.of(context).hasDrawer) return;
              Scaffold.of(context).openDrawer();
            },
          ),
          Gap(16.w),
          Text(title, style: AppTextStyles.bold27),
          if (hasEdit) ...[
            const Spacer(),
            CustomIconButton(icon: 'add', onTap: onAdd),
          ],
        ],
      ),
    );
  }
}
