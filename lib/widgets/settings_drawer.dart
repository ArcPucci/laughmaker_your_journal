import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/screens/premium_screen.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/buttons/custom_button_1.dart';
import 'package:laughmaker_your_journal/widgets/buttons/custom_icon_button.dart';
import 'package:provider/provider.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 309.w,
      height: 578.h,
      decoration: const BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Consumer<TagsProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return Container(
                width: 309.w,
                height: 186.h,
                decoration: const BoxDecoration(
                  color: AppTheme.red,
                  image: DecorationImage(
                    image: AssetImage('assets/png/fireflies.png'),
                  ),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(10),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/png/micro.png',
                      width: 132.w,
                      height: 163.h,
                      fit: BoxFit.cover,
                    ),
                    Gap(2.w),
                    value.premium
                        ? Center(
                            child: Text(
                              "Laughmaker:\nYour Journal",
                              style: AppTextStyles.medium23,
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Upgrade to\npremium version",
                                style: AppTextStyles.medium17.copyWith(
                                  color: AppTheme.white2,
                                  letterSpacing: -0.41,
                                ),
                              ),
                              CustomButton1(
                                text: "Buy Premium",
                                onTap: () => onTapPremium(context),
                              ),
                            ],
                          ),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        const CustomIconButton(icon: 'key'),
                        Gap(16.w),
                        Text(
                          'Privacy Policy',
                          style: AppTextStyles.medium17.copyWith(
                            color: AppTheme.black2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(32.h),
                  Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        const CustomIconButton(icon: 'task'),
                        Gap(16.w),
                        Text(
                          'Terms & Conditions',
                          style: AppTextStyles.medium17.copyWith(
                            color: AppTheme.black2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(32.h),
                  Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        const CustomIconButton(icon: 'message'),
                        Gap(16.w),
                        Text(
                          'Support',
                          style: AppTextStyles.medium17.copyWith(
                            color: AppTheme.black2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(32.h),
                  Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        const CustomIconButton(icon: 'refresh'),
                        Gap(16.w),
                        Text(
                          'Restore',
                          style: AppTextStyles.medium17.copyWith(
                            color: AppTheme.black2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapPremium(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }
}
