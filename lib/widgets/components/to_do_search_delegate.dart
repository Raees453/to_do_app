import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/event.dart';

class ToDoSearchDelegate extends SearchDelegate {
  List<Event> event;

  ToDoSearchDelegate(this.event);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      CloseButton(
        onPressed: () {
          if (query.isEmpty) {
            Navigator.of(context).pop();
          } else {
            query = '';
          }
        },
        color: Colors.white,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
          color: Colors.teal,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchedEvents = event
        .where((element) =>
            element.title.toUpperCase().contains(query.toUpperCase()))
        .toList();

    return ListView.builder(
      itemCount: searchedEvents.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(searchedEvents.elementAt(index).title),
        onTap: () {
          query = searchedEvents.elementAt(index).title;
          buildResults(context);
        },
      ),
    );
  }
}
