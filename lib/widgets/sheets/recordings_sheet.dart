import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RecordingsSheet extends StatefulWidget {
  const RecordingsSheet({super.key, required this.jokeId});

  final int jokeId;

  @override
  State<RecordingsSheet> createState() => _RecordingsSheetState();
}

class _RecordingsSheetState extends State<RecordingsSheet> {
  late RecordingsProvider recordingsProvider;
  late AudioPlayer audioPlayer;

  int playing = -1;
  int _duration = 0;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    recordingsProvider = Provider.of(context, listen: false);
    recordingsProvider.loadRecordings(widget.jokeId);
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 393.w,
        height: 198.h + overlay.bottom,
        decoration: const BoxDecoration(
          color: AppTheme.grey3,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Consumer<RecordingsProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: Navigator.of(context).pop,
                  child: Text(
                    "Cancel",
                    style: AppTextStyles.medium17.copyWith(color: AppTheme.red),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.recordings.length,
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 16.w,
                    ),
                    itemBuilder: (context, index) {
                      final recording = value.recordings[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: RecordingCard(
                          index: index,
                          playing: playing == index,
                          recording: recording,
                          duration: _duration,
                          onDelete: () => onDelete(index + 1, recording),
                          onPlay: () => onPlay(index, recording),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void onPlay(int index, Recording recording) async {
    if (index == playing) {
      playing = -1;
      await audioPlayer.stop();
      setState(() {});
      return;
    }

    playing = index;

    Source source = DeviceFileSource(recording.path);
    await audioPlayer.play(source);

    final duration = await audioPlayer.getDuration() ?? Duration.zero;
    final seconds = duration.inSeconds;
    setState(() {});

    audioPlayer.onPlayerComplete.listen((event) {
      playing = -1;
      setState(() {});
    });

    await audioPlayer.onPositionChanged.listen((event) {
      _duration = seconds - event.inSeconds;
      if (mounted) setState(() {});
    });
  }

  void onDelete(int index, Recording recording) async {
    final delete = await showCupertinoModalPopup(
      context: context,
      barrierColor: AppTheme.darkRed.withOpacity(0.62),
      builder: (context) {
        return DeleteSheet(
          title: "Are you sure you want to\ndelete Audio recording $index?",
        );
      },
    );
    if (!(delete ?? true)) return;
    await recordingsProvider.onDelete(recording);
    if(recordingsProvider.recordings.isNotEmpty) return;

    Navigator.of(context).pop();
  }
}
