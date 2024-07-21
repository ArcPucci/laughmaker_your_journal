import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AddJokeScreen extends StatefulWidget {
  const AddJokeScreen({super.key, this.edit = false});

  final bool edit;

  @override
  State<AddJokeScreen> createState() => _AddJokeScreenState();
}

class _AddJokeScreenState extends State<AddJokeScreen> {
  late JokesProvider jokesProvider;
  late TagsProvider tagsProvider;
  late RecordingsProvider recordingsProvider;

  Joke _joke = Joke.empty();

  final titleController = TextEditingController();
  final titleFocus = FocusNode();

  final contentController = TextEditingController();
  final contentFocus = FocusNode();

  List<Tag> _tags = [];

  bool get visibleRecordings => recordingsProvider.recordings.isNotEmpty;

  @override
  void initState() {
    super.initState();
    jokesProvider = Provider.of(context, listen: false);
    tagsProvider = Provider.of(context, listen: false);
    recordingsProvider = Provider.of(context, listen: false);

    recordingsProvider.loadRecordings(_joke.id);

    titleController.addListener(() => setState(() {}));
    titleFocus.addListener(() => setState(() {}));

    contentController.addListener(() => setState(() {}));
    contentFocus.addListener(() => setState(() {}));

    if (!widget.edit) return;

    _joke = jokesProvider.joke;
    titleController.text = _joke.title;
    contentController.text = _joke.content;

    recordingsProvider.loadRecordings(_joke.id);

    _tags = tagsProvider.tags.where((e) => _joke.tags.contains(e.id)).toList();
  }

  bool get hasDone => titleFocus.hasFocus || contentFocus.hasFocus;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.bg,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Center(
                child: Image.asset(
                  'assets/png/bg2.png',
                  width: 130.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  Gap(24.h),
                  BackAppBar(
                    title: "My Jokes",
                    laggingWidget: GestureDetector(
                      onTap: onDone,
                      child: Text(
                        "Done",
                        style: AppTextStyles.medium19.copyWith(
                          color: AppTheme.red,
                        ),
                      ),
                    ),
                  ),
                  Consumer<TagsProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Visibility(
                        visible: value.premium,
                        child: Column(
                          children: [
                            Gap(24.h),
                            TagsRow(tags: _tags, onChanged: onChanged),
                          ],
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Column(
                        children: [
                          CustomInput(
                            focusNode: titleFocus,
                            controller: titleController,
                          ),
                          Gap(16.h),
                          CustomInput(
                            textStyle: AppTextStyles.regular15,
                            focusNode: contentFocus,
                            controller: contentController,
                          ),
                          Gap(150.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16.w,
              right: 16.w,
              bottom: 16.h,
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<RecordingsProvider>(
                      builder: (
                        BuildContext context,
                        RecordingsProvider value,
                        Widget? child,
                      ) {
                        return Visibility(
                          visible: value.recordings.isNotEmpty,
                          child: CustomIconButton(
                            icon: 'sound',
                            size: 44.r,
                            iconSize: 36.r,
                            onTap: onShowRecordingsList,
                          ),
                        );
                      },
                    ),
                    Gap(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                          icon: 'audio',
                          size: 44.r,
                          iconSize: 36.r,
                          onTap: onShowAudioRecordBox,
                        ),
                        CustomIconButton(
                          icon: 'trash',
                          size: 44.r,
                          iconSize: 36.r,
                          onTap: onDeleteJoke,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onShowHint() async {
    await showDialog(
      context: context,
      barrierColor: AppTheme.darkRed.withOpacity(0.62),
      builder: (context) {
        return const RecordingsHintDialog();
      },
    );
  }

  void onDone() {
    if (titleFocus.hasFocus || contentFocus.hasFocus) {
      if (titleFocus.hasFocus) titleFocus.unfocus();
      if (contentFocus.hasFocus) contentFocus.unfocus();
    }

    final tags = _tags.map((e) => e.id).toList();

    _joke = _joke.copyWith(
      tags: tags,
      title: titleController.text,
      content: contentController.text,
    );

    if (widget.edit) {
      jokesProvider.onUpdate(_joke);
    } else {
      jokesProvider.onCreate(_joke);
    }

    context.pop();
  }

  void onShowAudioRecordBox() async {
    await showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return const AudioRecorderSheet();
      },
    );

    setState(() {});
    if (tagsProvider.hint || !visibleRecordings) return;

    tagsProvider.onHint();
    onShowHint();
  }

  void onShowRecordingsList() async {
    await showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return RecordingsSheet(jokeId: _joke.id);
      },
    );
  }

  void onDeleteJoke() async {
    final res = await showCupertinoModalPopup(
      context: context,
      barrierColor: AppTheme.darkRed.withOpacity(0.62),
      builder: (context) {
        return const DeleteSheet(
          title: "Are you sure you want to\ndelete this entry?",
        );
      },
    );
    if (!(res ?? false)) return;
    jokesProvider.onDelete();
  }

  void onChanged(List<Tag> tags) {
    _tags = tags;
    setState(() {});
  }
}
