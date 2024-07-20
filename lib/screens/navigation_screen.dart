import 'package:flutter/material.dart';
import 'package:laughmaker_your_journal/utils/utils.dart';
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
    if (path.contains('add')) return child;
    if (path.contains('congrats')) return child;

    final visible = hasBottomBar();

    return Scaffold(
      backgroundColor: AppTheme.bg,
      drawer: const SettingsDrawer(),
      drawerScrimColor: AppTheme.darkRed.withOpacity(0.62),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(child: child),
            Visibility(visible: visible, child: CustomBottomBar(path: path)),
          ],
        ),
      ),
    );
  }

  bool hasBottomBar() {
    if (path.contains('quotes')) return false;
    if (path.contains('quiz')) return false;

    return true;
  }
}
