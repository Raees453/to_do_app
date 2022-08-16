import 'package:flutter/material.dart';

class EmptyEventListWidget extends StatelessWidget {
  const EmptyEventListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: const Center(
        child: Text('No Event Found'),
      ),
    );
  }
}
