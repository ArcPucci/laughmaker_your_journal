import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class AddJokeScreen extends StatefulWidget {
  const AddJokeScreen({super.key});

  @override
  State<AddJokeScreen> createState() => _AddJokeScreenState();
}

class _AddJokeScreenState extends State<AddJokeScreen> {
  final titleController = TextEditingController();
  final titleFocus = FocusNode();

  final contentController = TextEditingController();
  final contentFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    titleController.addListener(() => setState(() {}));
    titleFocus.addListener(() => setState(() {}));

    contentController.addListener(() => setState(() {}));
    contentFocus.addListener(() => setState(() {}));
  }

  bool get hasDone => titleFocus.hasFocus || contentFocus.hasFocus;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.bg,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Center(
                child: Image.asset(
                  'assets/png/bg2.png',
                  width: 130.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  Gap(24.h),
                  BackAppBar(
                    title: "My Jokes",
                    laggingWidget: Visibility(
                      visible: hasDone,
                      child: GestureDetector(
                        onTap: onDone,
                        child: Text(
                          "Done",
                          style: AppTextStyles.medium19.copyWith(
                            color: AppTheme.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(24.h),
                  CustomInput(
                    focusNode: titleFocus,
                    controller: titleController,
                  ),
                  Gap(16.h),
                  Expanded(
                    child: CustomInput(
                      textStyle: AppTextStyles.regular15,
                      focusNode: contentFocus,
                      controller: contentController,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomIconButton(
                      icon: 'sound',
                      size: 44.r,
                      iconSize: 36.r,
                      onTap: onShowHint,
                    ),
                    Gap(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          icon: 'audio',
                          size: 44.r,
                          iconSize: 36.r,
                        ),
                        CustomIconButton(
                          icon: 'trash',
                          size: 44.r,
                          iconSize: 36.r,
                          onTap: onDeleteJoke,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onShowHint() async {
    await showDialog(
      context: context,
      barrierColor: AppTheme.darkRed.withOpacity(0.62),
      builder: (context) {
        return const RecordingsHintDialog();
      },
    );
  }

  void onDone() {
    if (titleFocus.hasFocus) titleFocus.unfocus();
    if (contentFocus.hasFocus) contentFocus.unfocus();
  }

  void onDeleteJoke() async {
    await showCupertinoModalPopup(
      context: context,
      barrierColor: AppTheme.darkRed.withOpacity(0.62),
      builder: (context) {
        return const DeleteSheet(
          title: "Are you sure you want to\ndelete this entry?",
        );
      },
    );
  }
}
