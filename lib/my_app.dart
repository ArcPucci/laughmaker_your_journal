import 'package:flutter/material.dart';
import 'package:laughmaker_your_journal/providers/providers.dart';
import 'package:laughmaker_your_journal/router_controller.dart';
import 'package:laughmaker_your_journal/services/services.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.sqlService,
    required this.preferencesService,
  });

  final SqlService sqlService;
  final PreferencesService preferencesService;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routerController = RouterController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: widget.preferencesService),
        Provider(
          create: (context) => JokesService(
            database: widget.sqlService.database,
          ),
        ),
        Provider(
          create: (context) => TagsService(
            database: widget.sqlService.database,
          ),
        ),
        Provider(
          create: (context) => AudioRecordingsService(
            database: widget.sqlService.database,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => TagsProvider(
            tagsService: Provider.of(context, listen: false),
            preferencesService: widget.preferencesService,
          )..onInit(),
        ),
        ChangeNotifierProvider(
          create: (context) => JokesProvider(
            jokesService: Provider.of(context, listen: false),
            recordingsService: Provider.of(context, listen: false),
            router: routerController.router,
          )..onInit(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecordingsProvider(
            recordingsService: Provider.of(context, listen: false),
          )..onInit(),
        ),
        ChangeNotifierProvider(
          create: (context) => GuidesProvider(
            router: routerController.router,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => QuizProvider(
            router: routerController.router,
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(fontFamily: 'Onest'),
        routerConfig: routerController.router,
      ),
    );
  }
}
