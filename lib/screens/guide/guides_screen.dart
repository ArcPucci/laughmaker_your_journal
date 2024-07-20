import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';
import 'package:provider/provider.dart';

class GuidesScreen extends StatelessWidget {
  const GuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(24.h),
        const CustomAppBar(title: 'Guide'),
        Consumer<GuidesProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Expanded(
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
                          onTap: () => value.onSelect(guide),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
