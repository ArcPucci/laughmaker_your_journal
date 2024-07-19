import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/buttons/custom_button_2.dart';

class DeleteSheet extends StatelessWidget {
  const DeleteSheet({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 393.w,
        height: 216.h + overlay.bottom,
        decoration: const BoxDecoration(
          color: AppTheme.bg,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(16.r),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.medium17.copyWith(color: AppTheme.black),
                textAlign: TextAlign.center,
              ),
              CustomButton2(
                text: "Delete",
                color: AppTheme.red,
                textColor: AppTheme.white,
                onTap: () => Navigator.of(context).pop(true),
              ),
              CustomButton2(
                text: "Cancel",
                onTap: () => Navigator.of(context).pop(false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
