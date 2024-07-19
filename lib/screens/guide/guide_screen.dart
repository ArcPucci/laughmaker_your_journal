import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/models/guide.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/app_bars/back_app_bar.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guide = guides[2];
    return Column(
      children: [
        Gap(24.h),
        const BackAppBar(title: "Guide"),
        Gap(24.h),
        SizedBox(
          width: 361.w,
          child: Text(
            guide.title,
            style: AppTextStyles.bold25.copyWith(color: guide.color),
          ),
        ),
        Expanded(
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
                      guide.paragraphs.length,
                      (index) {
                        final paragraph = guide.paragraphs[index];

                        if (paragraph is BoldParagraph) {
                          return Text(
                            '${paragraph.content}\n',
                            style: AppTextStyles.medium17.copyWith(
                              color: AppTheme.black,
                            ),
                          );
                        }

                        if (paragraph is MixedParagraph) {
                          return RichText(
                            text: TextSpan(
                              children: List.generate(
                                paragraph.list.length,
                                (index) {
                                  final temp = paragraph.list[index];

                                  if (temp is BoldParagraph) {
                                    return TextSpan(
                                      text: temp.content,
                                      style: AppTextStyles.medium17.copyWith(
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
      ],
    );
  }
}
