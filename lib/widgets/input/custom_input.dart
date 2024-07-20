import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.focusNode,
    required this.controller,
    this.textStyle,
    this.hasHeight = true,
    required this.onChanged,
  });

  final TextStyle? textStyle;
  final FocusNode focusNode;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final bool hasHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361.w,
      height: (controller.text.isEmpty && hasHeight) ? (22 / 17) * 17.r : null,
      color: Colors.transparent,
      child: TextField(
        style: textStyle ?? AppTextStyles.extraBold17,
        controller: controller,
        focusNode: focusNode,
        maxLines: null,
        onChanged: onChanged,
        decoration: InputDecoration.collapsed(
          hintText: '',
          hintStyle: AppTextStyles.bold17.copyWith(
            color: AppTheme.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
