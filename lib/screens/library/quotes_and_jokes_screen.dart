import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class QuotesAndJokesScreen extends StatelessWidget {
  const QuotesAndJokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(24.h),
        const BackAppBar(title: 'Library'),
        Expanded(
          child: ListView.builder(
            itemCount: quotes.length,
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
            itemBuilder: (context, index) {
              final quote = quotes[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: QuoteCard(quote: quote),
              );
            },
          ),
        ),
      ],
    );
  }
}
