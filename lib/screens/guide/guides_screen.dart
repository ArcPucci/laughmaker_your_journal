import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/utils/guides.dart';
import 'package:laughmaker_your_journal/widgets/card/guide_card.dart';
import 'package:laughmaker_your_journal/widgets/app_bars/custom_app_bar.dart';

class GuidesScreen extends StatelessWidget {
  const GuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(24.h),
        const CustomAppBar(title: 'Guide'),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              children: List.generate(
                guides.length,
                (index) {
                  final guide = guides[index];
                  return Padding(
                    padding: EdgeInsets.only(top: index != 0 ? 16.h : 0),
                    child: GuideCard(
                      guide: guide,
                      onTap: () => context.go('/guides/guide'),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
