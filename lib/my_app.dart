import 'package:flutter/material.dart';
import 'package:laughmaker_your_journal/router_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routerController = RouterController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Onest'),
      routerConfig: routerController.router,
    );
  }
}
