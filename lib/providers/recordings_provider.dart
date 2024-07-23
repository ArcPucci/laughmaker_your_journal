import 'package:flutter/material.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/services/services.dart';

class RecordingsProvider extends ChangeNotifier {
  final AudioRecordingsService _recordingsService;

  RecordingsProvider({
    required AudioRecordingsService recordingsService,
  }) : _recordingsService = recordingsService;

  List<Recording> _recordings = [];

  List<Recording> get recordings => _recordings;

  int _lastRecordingId = 0;

  int get lastRecordingId => _lastRecordingId;

  int _jokeId = -1;

  void onInit() async {
    await _recordingsService.onDeleteByJoke(-1);
  }

  void onCreate(Recording recording) async {
    await _getLastId();
    await _recordingsService.onCreate(recording);
    _jokeId = recording.jokeId;

    _recordings = await _recordingsService.getRecordings(recording.jokeId);
    notifyListeners();
  }

  Future<void> _getLastId() async {
    final list = await _recordingsService.getAllRecordings();

    if (list.isEmpty) return;

    _lastRecordingId = list.last.id + 1;
  }

  Future<void> onDelete(Recording recording) async {
    await _recordingsService.onDelete(recording);

    await _getLastId();
    _recordings = await _recordingsService.getRecordings(_jokeId);
    notifyListeners();
  }

  void loadRecordings(int jokeId) async {
    _jokeId = jokeId;

    await _getLastId();
    _recordings = await _recordingsService.getRecordings(jokeId);
    notifyListeners();
  }
}
