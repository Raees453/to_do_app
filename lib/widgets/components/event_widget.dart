import 'package:flutter/material.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({Key? key}) : super(key: key);

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 10,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
        ),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Take a call with Parents'),
        ),
        subtitle: const Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.notifications_none, size: 20),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.flag),
        ),
        minLeadingWidth: 10,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
