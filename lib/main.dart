import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/pages/pages.dart';

void main() {
  // ProviderContainer()
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'NotoSanJP',
        primarySwatch: Colors.deepOrange,
        // outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom())
      ),
      home: const Splash(),
    );
  }
}
