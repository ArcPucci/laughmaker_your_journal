import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/buttons/custom_button_2.dart';
import 'package:laughmaker_your_journal/widgets/input/custom_input_2.dart';

class NewTagDialog extends StatefulWidget {
  const NewTagDialog({super.key});

  @override
  State<NewTagDialog> createState() => _NewTagDialogState();
}

class _NewTagDialogState extends State<NewTagDialog> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 361.w,
        height: 240.h,
        decoration: BoxDecoration(
          color: AppTheme.white4,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cancel",
              style: AppTextStyles.medium17.copyWith(color: AppTheme.red3),
            ),
            Text(
              "Name your tag",
              style: AppTextStyles.bold22.copyWith(color: AppTheme.black2),
            ),
            CustomInput2(controller: controller),
            CustomButton2(
              text: 'Add tag',
              color: AppTheme.red,
              textColor: AppTheme.white,
              onTap: onAdd,
            ),
          ],
        ),
      ),
    );
  }

  void onAdd() {
    Navigator.of(context).pop();
  }
}
