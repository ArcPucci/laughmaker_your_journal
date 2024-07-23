import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/models/guide.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/app_bars/back_app_bar.dart';
import 'package:provider/provider.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GuidesProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(
          children: [
            Gap(24.h),
            const BackAppBar(title: "Guide"),
            Gap(24.h),
            SizedBox(
              width: 361.w,
              child: Text(
                value.guide.title,
                style: AppTextStyles.bold25.copyWith(color: value.guide.color),
              ),
            ),
            Expanded(
              child: SafeArea(
                top: false,
                child: Stack(
                  children: [
                    Positioned(
                      top: 55.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          'assets/png/bg.png',
                          width: 280.w,
                          height: 528.h,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          vertical: 24.h,
                          horizontal: 16.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            value.guide.paragraphs.length,
                            (index) {
                              final paragraph = value.guide.paragraphs[index];

                              if (paragraph is BoldParagraph) {
                                return Text(
                                  '${paragraph.content}\n',
                                  style: AppTextStyles.medium17.copyWith(
                                    color: AppTheme.black,
                                  ),
                                );
                              }

                              if (paragraph is MixedParagraph) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (paragraph.id != null)
                                      Text(
                                        paragraph.id! + '. ',
                                        style: AppTextStyles.regular17.copyWith(
                                          height: 1.368,
                                        ),
                                      ),
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          children: List.generate(
                                            paragraph.list.length,
                                            (index) {
                                              final temp = paragraph.list[index];

                                              if (temp is BoldParagraph) {
                                                return TextSpan(
                                                  text: temp.content,
                                                  style: AppTextStyles.medium17
                                                      .copyWith(
                                                    color: AppTheme.black,
                                                  ),
                                                );
                                              }

                                              return TextSpan(
                                                text: temp.content,
                                                style: AppTextStyles.regular17,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }

                              return Text(
                                '${paragraph.content}\n',
                                style: AppTextStyles.regular17,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(66.h),
          ],
        );
      },
    );
  }
}
