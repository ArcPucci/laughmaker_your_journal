import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:provider/provider.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/png/paywall.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  Gap(40.h),
                  Text(
                    "Unlimited journal tags",
                    style: AppTextStyles.bold27.copyWith(
                      color: AppTheme.black3,
                    ),
                  ),
                  Gap(32.h),
                  Text(
                    "No ads",
                    style: AppTextStyles.bold27.copyWith(
                      color: AppTheme.black3,
                    ),
                  ),
                  Gap(32.h),
                  Text(
                    "We appreciate the support!",
                    style: AppTextStyles.bold27.copyWith(color: Colors.black),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => onBuyPremium(context),
                    child: Container(
                      width: 288.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Buy now for just \$0,99",
                        style: AppTextStyles.bold23,
                      ),
                    ),
                  ),
                  Gap(24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onBuyPremium(BuildContext context) {
    final value = Provider.of<TagsProvider>(context, listen: false);
    value.onBuyPremium();
    Navigator.of(context).pop();
  }
}
