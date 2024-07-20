import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            Gap(24.h),
            BackAppBar(title: "Library"),
            Gap(24.h),
            SizedBox(
              width: 361.w,
              child: Text(
                'Choose level',
                style: AppTextStyles.medium19.copyWith(color: Colors.black),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  final level = levels[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: LevelCard(level: level, onTap: value.onStart),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
