import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'my_app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(
      ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (context, child) => const MyApp(),
      ),
    );
  }, (error, stack) {
    print(error);
    print(stack);
  });
}
