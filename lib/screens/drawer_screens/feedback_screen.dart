import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  static const String route = '/feedback-screen';
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Feedback'),
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text('Feedback Screen'),
      ),
    );
  }
}
