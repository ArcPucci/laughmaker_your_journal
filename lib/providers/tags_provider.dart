import 'package:flutter/material.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/services/services.dart';

class TagsProvider extends ChangeNotifier {
  final TagsService _tagsService;
  final PreferencesService _preferencesService;

  TagsProvider({
    required TagsService tagsService,
    required PreferencesService preferencesService,
  })  : _tagsService = tagsService,
        _preferencesService = preferencesService;

  bool _premium = false;

  bool get premium => _premium;

  bool _hint = false;

  bool get hint => _hint;

  List<Tag> _tags = [];

  List<Tag> get tags => _tags;

  List<Tag> getTags(List<int> indexes) {
    final list = _tags.where((e) => indexes.contains(e.id)).toList();
    return list;
  }

  void onInit() async {
    _tags = await _tagsService.getTags();
    _premium = _preferencesService.getPremium();
    _hint = _preferencesService.getHint();
    notifyListeners();
  }

  void onCreate(String value) async {
    final tag = Tag(id: 0, tag: value);
    await _tagsService.onCreate(tag);

    _tags = await _tagsService.getTags();
    notifyListeners();
  }

  void onDelete(Tag tag) async {
    await _tagsService.onDelete(tag);

    _tags = await _tagsService.getTags();
    notifyListeners();
  }

  void onHint() async {
    _hint = true;
    await _preferencesService.setHint();
  }

  void onBuyPremium() async {
    _premium = true;
    await _preferencesService.setPremium();
    notifyListeners();
  }
}
