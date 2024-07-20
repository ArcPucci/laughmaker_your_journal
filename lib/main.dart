import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laughmaker_your_journal/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final sqlService = SqlService();
    await sqlService.init();

    final preferences = await SharedPreferences.getInstance();
    final preferencesService = PreferencesService(preferences: preferences);

    runApp(
      ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (context, child) => MyApp(
          sqlService: sqlService,
          preferencesService: preferencesService,
        ),
      ),
    );
  }, (error, stack) {
    print(error);
    print(stack);
  });
}
