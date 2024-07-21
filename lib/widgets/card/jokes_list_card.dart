import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/card/joke_card.dart';
import 'package:provider/provider.dart';

class JokesListCard extends StatelessWidget {
  const JokesListCard({
    super.key,
    required this.title,
    required this.jokes,
    required this.onSelect,
  });

  final String title;
  final List<Joke> jokes;
  final void Function(Joke) onSelect;

  @override
  Widget build(BuildContext context) {
    return Consumer<TagsProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return SizedBox(
          width: 361.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.medium19),
              Gap(8.h),
              Container(
                width: 361.w,
                decoration: BoxDecoration(
                  color: AppTheme.grey2,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Column(
                  children: List.generate(
                    jokes.length,
                    (index) {
                      final joke = jokes[index];
                      final tags = value.getTags(joke.tags);
                      return JokeCard(
                        hasBorder: index != 0,
                        joke: joke,
                        tags: tags,
                        onTap: () => onSelect(joke),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
