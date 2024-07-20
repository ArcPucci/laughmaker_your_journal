import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'package:path/path.dart' as p;

class AudioRecorderSheet extends StatefulWidget {
  const AudioRecorderSheet({super.key});

  @override
  State<AudioRecorderSheet> createState() => _AudioRecorderSheetState();
}

class _AudioRecorderSheetState extends State<AudioRecorderSheet> {
  late AudioRecorder audioRecord;
  late JokesProvider jokesProvider;
  late RecordingsProvider recordingsProvider;

  Timer? _timer;
  bool _recording = false;
  int _duration = 0;

  @override
  void initState() {
    jokesProvider = Provider.of(context, listen: false);
    recordingsProvider = Provider.of(context, listen: false);
    audioRecord = AudioRecorder();
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final overlay = MediaQuery.of(context).padding;
    final timer = _getTimer(_duration);
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 393.w,
        height: 146.h + overlay.bottom,
        decoration: const BoxDecoration(
          color: AppTheme.grey3,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.only(bottom: overlay.bottom, top: 16.h),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Audio recording", style: AppTextStyles.bold22),
                  CustomIconButton(
                    icon: _recording ? 'stop' : 'audio',
                    size: 68.r,
                    iconSize: 46.r,
                    borderRadius: 10,
                    onTap: onTap,
                  ),
                  Text(timer, style: AppTextStyles.medium22),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 16.w,
              child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Text(
                  "Cancel",
                  style: AppTextStyles.medium17.copyWith(color: AppTheme.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onStarRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        final directory = await getApplicationCacheDirectory();

        final id = recordingsProvider.lastRecordingId;

        final filePath = p.join(directory.path, "recording$id.m4a");

        _duration = 0;
        await audioRecord.start(const RecordConfig(), path: filePath);

        _recording = true;
        setState(() {});

        _timer = Timer.periodic(
          const Duration(seconds: 1),
          (timer) {
            _duration++;
            setState(() {});
          },
        );
      }
    } catch (_) {
      print(_);
    }
  }

  Future<void> onStopRecording() async {
    try {
      final path = await audioRecord.stop();
      final recording = Recording(
        id: 0,
        jokeId: jokesProvider.joke.id,
        path: path!,
        created: DateTime.now(),
        duration: _duration,
      );

      recordingsProvider.onCreate(recording);

      _duration = 0;
      _recording = false;
      _timer?.cancel();
      _timer = null;
      setState(() {});
    } catch (_) {
      print(_);
    }
  }

  void onTap() async {
    if (_recording) {
      await onStopRecording();
    } else {
      await onStarRecording();
    }
  }

  String _getTimer(int duration) {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;

    final text1 = minutes.toString().padLeft(2, '0');
    final text2 = seconds.toString().padLeft(2, '0');

    return '$text1:$text2';
  }
}
