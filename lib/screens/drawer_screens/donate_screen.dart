import 'package:flutter/material.dart';

class DonateScreen extends StatelessWidget {
  static const String route = '/donate-screen';

  const DonateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Donate'),
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text('Donate Screen'),
      ),
    );
  }
}
