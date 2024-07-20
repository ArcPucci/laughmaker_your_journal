import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TagsDialog extends StatefulWidget {
  const TagsDialog({
    super.key,
    required this.onChanged,
    required this.tags,
  });

  final List<Tag> tags;
  final void Function(List<Tag>) onChanged;

  @override
  State<TagsDialog> createState() => _TagsDialogState();
}

class _TagsDialogState extends State<TagsDialog> {
  bool _show = true;

  List<Tag> _tags = [];

  @override
  void initState() {
    _tags = widget.tags;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_show) return SizedBox();
    return Consumer<TagsProvider>(
      builder: (BuildContext context, value, Widget? child) {
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
                    value.tags.length,
                    (index) {
                      final tag = value.tags[index];
                      return TagCard(
                        tag: tag,
                        selected: widget.tags.contains(tag),
                        onTap: () => onSelect(tag),
                        onDelete: () => value.onDelete(tag),
                      );
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
      },
    );
  }

  void onSelect(Tag tag) {
    if (_tags.contains(tag)) {
      _tags.remove(tag);
    } else {
      _tags.add(tag);
    }

    widget.onChanged(_tags);
    setState(() {});
  }

  void onCreateTag(BuildContext context) async {
    _show = false;
    setState(() {});

    await showDialog(
      context: context,
      barrierColor: Colors.transparent,
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

    _show = true;
    setState(() {});
  }
}
