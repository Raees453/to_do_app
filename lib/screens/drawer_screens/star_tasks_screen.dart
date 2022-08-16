import 'package:flutter/material.dart';

class StarTasksScreen extends StatelessWidget {
  static const String route = '/star-tasks-screen';

  const StarTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Star Tasks'),
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text('Star Tasks Screen'),
      ),
    );
  }
}
