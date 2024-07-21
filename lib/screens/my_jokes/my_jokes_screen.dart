import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MyJokesScreen extends StatelessWidget {
  const MyJokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JokesProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            Gap(24.h),
            CustomAppBar(
              title: 'My Jokes',
              hasEdit: true,
              onAdd: value.onCreate,
            ),
            Expanded(
              child: value.empty ? _buildEmptyBody(value) : _buildList(value),
            ),
          ],
        );
      },
    );
  }

  Widget _buildList(JokesProvider value) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: [
          if (value.jokes.isNotEmpty) ...[
            JokesListCard(
              title: 'Today',
              jokes: value.jokes,
              onSelect: value.onSelect,
            ),
            Gap(20.h),
          ],
          if (value.lastWeek.isNotEmpty) ...[
            JokesListCard(
              title: 'Last 7 days',
              jokes: value.lastWeek,
              onSelect: value.onSelect,
            ),
            Gap(20.h),
          ],
          if (value.lastMonth.isNotEmpty) ...[
            JokesListCard(
              title: 'Last 30 days',
              jokes: value.lastMonth,
              onSelect: value.onSelect,
            ),
            Gap(20.h),
          ],
          Gap(100.h),
        ],
      ),
    );
  }

  Widget _buildEmptyBody(JokesProvider value) {
    return Column(
      children: [
        Gap(236.h),
        CustomIconButton(
          icon: 'add',
          size: 68.r,
          iconSize: 56.r,
          borderRadius: 10,
          onTap: value.onCreate,
        ),
        Gap(8.h),
        Text("You don't have records.", style: AppTextStyles.regular17),
        Text("Add the first one now!", style: AppTextStyles.regular17),
      ],
    );
  }
}
