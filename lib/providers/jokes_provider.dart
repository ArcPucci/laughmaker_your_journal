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

  Joke _joke = Joke.empty();

  Joke get joke => _joke;

  List<Joke> _jokes = [];

  List<Joke> get jokes => _jokes;

  void onInit() async {
    _jokes = await _jokesService.getJokes();
    notifyListeners();
  }

  void onCreate() async {
    final joke = Joke.empty();
    _joke = await _jokesService.onCreate(joke);

    _jokes = await _jokesService.getJokes();
    notifyListeners();

    _router.go('/add');
  }

  void onUpdate(Joke joke) async {
    _joke = await _jokesService.onUpdate(joke);

    _jokes = await _jokesService.getJokes();
    notifyListeners();
  }

  void onDelete() async {
    await _recordingsService.onDeleteByJoke(_joke.id);
    await _jokesService.onDelete(_joke);

    _jokes = await _jokesService.getJokes();
    _router.pop();
  }

  void onSelect(Joke joke) async {
    _joke = joke;
    _router.go('/edit');
  }
}
