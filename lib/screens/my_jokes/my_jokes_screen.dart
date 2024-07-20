import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MyJokesScreen extends StatelessWidget {
  const MyJokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<JokesProvider, TagsProvider>(
      builder: (BuildContext context, value, value2, Widget? child) {
        return Column(
          children: [
            Gap(24.h),
            CustomAppBar(
              title: 'My Jokes',
              hasEdit: true,
              onAdd: value.onCreate,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                itemCount: value.jokes.length,
                itemBuilder: (context, index) {
                  final joke = value.jokes[index];
                  final tags = value2.getTags(joke.tags);
                  return JokeCard(
                    tags: tags,
                    onTap: () => value.onSelect(joke),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildList() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: [
          JokesListCard(title: 'Today'),
          Gap(20.h),
          const JokesListCard(title: 'Last 7 days'),
          Gap(20.h),
          const JokesListCard(title: 'Last 30 days'),
          Gap(20.h),
        ],
      ),
    );
  }

  Widget _buildEmptyBody(BuildContext context) {
    return Column(
      children: [
        Gap(236.h),
        CustomIconButton(
          icon: 'add',
          size: 68.r,
          iconSize: 56.r,
          borderRadius: 10,
          onTap: () => context.go('/add'),
        ),
        Gap(8.h),
        Text("You don't have records.", style: AppTextStyles.regular17),
        Text("Add the first one now!", style: AppTextStyles.regular17),
      ],
    );
  }
}
