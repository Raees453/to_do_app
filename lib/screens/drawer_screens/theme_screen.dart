import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  static const String route = '/theme-screen';
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Theme'),
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text('Theme Screen'),
      ),
    );
  }
}
