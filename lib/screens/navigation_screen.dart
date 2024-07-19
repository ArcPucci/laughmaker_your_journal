import 'package:flutter/material.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
import 'package:laughmaker_your_journal/widgets/settings_drawer.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    super.key,
    required this.path,
    required this.child,
  });

  final String path;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      drawer: const SettingsDrawer(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(child: child),
            CustomBottomBar(path: path),
          ],
        ),
      ),
    );
  }
}
