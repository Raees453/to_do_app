import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../screens/home_screen.dart';
import '../utils/theme.dart';

void main() {
  initializeDateFormatting().then((value) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: getDarkTheme(),
      theme: getLightTheme(),
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      home: const HomeScreen(),
    );
  }
}
