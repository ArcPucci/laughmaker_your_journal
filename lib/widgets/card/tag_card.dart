import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/widgets/tag_widget.dart';

class TagCard extends StatelessWidget {
  const TagCard({
    super.key,
    required this.tag,
    this.onTap,
    this.onDelete,
    this.selected = false,
  });

  final bool selected;
  final Tag tag;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 9.w),
            child: TagWidget(selected: selected, tag: tag, onTap: onTap),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onDelete,
              child: Image.asset(
                'assets/png/icons/close.png',
                width: 18.w,
                height: 18.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
