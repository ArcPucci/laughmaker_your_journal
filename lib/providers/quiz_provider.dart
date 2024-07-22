import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/buttons/check_button.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class QuizProvider extends ChangeNotifier {
  QuizProvider({required GoRouter router}) : _router = router;

  final GoRouter _router;

  Quote get quote => _quotes[_currentIndex];

  List<String> _answers = List.generate(4, (index) => '');

  List<String> get answers => _answers;

  List<Quote> _quotes = List.from(classicQuotes);

  Level _level = levels.first;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex + 1;

  int get total => _quotes.length;

  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  int _score = 0;

  int get score => _score;

  ButtonState _buttonState = ButtonState.idle;

  ButtonState get buttonState => _buttonState;

  List<String> _names = [];

  void onStart(Level level) {
    _names = level.quotes.map((e) => e.author).toList();
    _level = level;
    _buttonState = ButtonState.idle;
    _currentIndex = 0;
    _score = 0;
    _selectedIndex = -1;
    _onGenerateQuotes();
    _onGenerateAnswers();
    _router.go('/library/levels/quiz');
  }

  void onAnswer(int index) {
    _selectedIndex = index;
    _buttonState = ButtonState.selected;
    notifyListeners();
  }

  void onCheck() {
    if (_selectedIndex == -1) return;

    if (_buttonState == ButtonState.correct ||
        _buttonState == ButtonState.wrong) {
      if (_currentIndex >= _quotes.length - 1) {
        _router.go('/library/levels/congrats');
        return;
      }

      _buttonState = ButtonState.idle;
      _selectedIndex = -1;
      _currentIndex++;

      _onGenerateAnswers();

      notifyListeners();
      return;
    }

    if (quote.author == _answers[_selectedIndex]) {
      _buttonState = ButtonState.correct;
      _score++;
    } else {
      _buttonState = ButtonState.wrong;
    }

    notifyListeners();
  }

  void goToLibrary() {
    _router.pop();
  }

  void _onGenerateQuotes() {
    final temp = List.from(_level.quotes);

    temp.shuffle();
    _quotes = List.from(temp.take(10));
  }

  void _onGenerateAnswers() {
    final temp = [quote.author];

    int rand = Random().nextInt(_names.length);

    while (temp.length < 4) {
      final name = _names[rand];
      if (temp.contains(name)) {
        rand = Random().nextInt(_names.length);
        continue;
      }

      temp.add(name);
    }

    _answers = List.from(temp);
    _answers.shuffle();
  }
}
