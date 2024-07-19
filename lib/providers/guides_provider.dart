import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/models/models.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';

class GuidesProvider extends ChangeNotifier {
  final GoRouter _router;
  GuidesProvider({required GoRouter router}) : _router = router;

  Guide _guide = guides.first;

  Guide get guide => _guide;

  void onSelect(Guide guide) {
    _guide = guide;
    _router.go('/guides/guide');
  }
}