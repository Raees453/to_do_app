import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/helpers/db_helper.dart';
import 'package:intl/intl.dart';

import '../models/event.dart';
import '../models/event_category.dart';

class EventsProvider with ChangeNotifier {
  List<Event> _events = [];

  final List<Event> _todayEvents = [];
  final List<Event> _completedEvents = [];
  final List<Event> _pendingEvents = [];

  List<Event> get events => _events;

  List<Event> get todayEvents => _todayEvents;

  List<Event> get completedEvents => _completedEvents;

  List<Event> get pendingEvents => _pendingEvents;

  fetchEvents() async {
    if (_events.isEmpty) {
      final eventsList = await DBHelper.fetchData('events');
      _events = eventsList.map((e) => Event.fromMap(e)).toList();
      filterByCompleted();
      filterByToday();
      filterByPending();
    }
  }

  insertEvent(Event event) {
    _events.add(event);
    DBHelper.insert('events', event.toMap());
    notifyListeners();
  }

  get totalCompletedEventsCount {
    int count = 0;
    _completedEvents
        .forEach((element) => count += element.subEvents?.length as int);
    return count;
  }

  get totalPendingEventsCount => 2;

  removeEvent(Event event) {
    _todayEvents.remove(event);
    notifyListeners();
  }

  filterEvents(DateTime date) {
    final filteredEvents = [];

    for (var e in _events) {
      final dateE = DateFormat.yMd().format(e.date);
      final dateToday = DateFormat.yMd().format(date);

      if (dateE == dateToday) {
        filteredEvents.add(e);
      }
    }

    return filteredEvents;
  }

  filterByCategory(EventCategory? category) {
    if (category == null) {
      return events;
    }

    return _events.where((element) => element.category == category).toList();
  }

  filterPendingTasksByCategory(EventCategory? category) {
    if (category == null) {
      return events;
    }

    return _pendingEvents
        .where((element) => element.category == category)
        .toList();
  }

  filterCompletedTasksByCategory(EventCategory? category) {
    if (category == null) {
      return events;
    }

    return _completedEvents
        .where((element) => element.category == category)
        .toList();
  }

  filterByToday() {
    final todayDate = DateTime.now();
    _events.forEach((element) {
      if (element.date.year == todayDate.year &&
          element.date.month == todayDate.month &&
          element.date.day == todayDate.day) {
        _todayEvents.add(element);
      }
    });
  }

  filterByCompleted() {
    final todayDate = DateTime.now();
    _events.forEach((element) {
      if (element.date.isBefore(todayDate)) {
        _completedEvents.add(element);
      }
    });
  }

  filterByPending() {
    final todayDate = DateTime.now();
    _events.forEach((element) {
      if (element.date.isAfter(todayDate)) {
        _pendingEvents.add(element);
      }
    });
  }
}
