import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class MyJokesScreen extends StatelessWidget {
  const MyJokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(24.h),
        const CustomAppBar(title: 'My Jokes', hasEdit: true),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              children: [
                const JokesListCard(title: 'Today'),
                Gap(20.h),
                const JokesListCard(title: 'Last 7 days'),
                Gap(20.h),
                const JokesListCard(title: 'Last 30 days'),
                Gap(20.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
