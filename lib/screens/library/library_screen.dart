import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(24.h),
        const CustomAppBar(title: 'Library'),
        Gap(24.h),
        const QuotesAndJokesBox(),
        Gap(24.h),
        const QuizBox(),
      ],
    );
  }
}
