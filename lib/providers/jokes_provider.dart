import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/services/services.dart';

class JokesProvider extends ChangeNotifier {
  final JokesService _jokesService;
  final AudioRecordingsService _recordingsService;
  final GoRouter _router;

  JokesProvider({
    required JokesService jokesService,
    required AudioRecordingsService recordingsService,
    required GoRouter router,
  })  : _jokesService = jokesService,
        _recordingsService = recordingsService,
        _router = router;

  bool get empty => _jokes.isEmpty && _lastWeek.isEmpty && _lastMonth.isEmpty;

  Joke _joke = Joke.empty();

  Joke get joke => _joke;

  List<Joke> _jokes = [];

  List<Joke> get jokes => _jokes;

  List<Joke> _lastWeek = [];

  List<Joke> get lastWeek => _lastWeek;

  List<Joke> _lastMonth = [];

  List<Joke> get lastMonth => _lastMonth;

  void onInit() async {
    await _updateJokes();
    notifyListeners();
  }

  void onAdd() async {
    await _recordingsService.onDeleteByJoke(-1);
    _joke = Joke.empty();
    _router.go('/add');
  }

  void onCreate(Joke joke) async {
    _joke = await _jokesService.onCreate(joke);

    final list = await _recordingsService.getRecordings(-1);
    print(list.length);

    for (final item in list) {
      await _recordingsService.onUpdate(
        item.copyWith(jokeId: _joke.id),
      );
    }

    await _updateJokes();
    notifyListeners();
  }

  void onUpdate(Joke joke) async {
    _joke = await _jokesService.onUpdate(joke);

    await _updateJokes();
    notifyListeners();
  }

  void onDelete() async {
    await _recordingsService.onDeleteByJoke(_joke.id);
    await _jokesService.onDelete(_joke);

    await _updateJokes();
    _router.pop();
  }

  Future<void> _updateJokes() async {
    _jokes = await _jokesService.getJokes();
    _lastWeek = await _jokesService.getLastWeek();
    _lastMonth = await _jokesService.getLastMonth();
  }

  void onSelect(Joke joke) async {
    _joke = joke;
    _router.go('/edit');
  }
}
