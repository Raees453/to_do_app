import 'package:flutter_to_do_app/models/event_category.dart';

import '../utils/utils.dart';

class Event {
  String id;
  String title;
  DateTime date;
  EventCategory category;
  List<Event>? subEvents;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.category,
    this.subEvents,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      title: map['title'],
      date: Utils.convertToDateTime(map['date']),
      category: _getCategory(map['category']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': Utils.convertToTimeStamp(date),
      'category': category.name.toUpperCase(),
    };
  }

  static EventCategory _getCategory(String name) {
    switch (name) {
      case 'PERSONAL':
        return EventCategory.personal;
      case 'WISHLIST':
        return EventCategory.wishList;
      case 'WORK':
        return EventCategory.work;
      case 'BIRTHDAY':
        return EventCategory.birthday;
      default:
        return EventCategory.noCategory;
    }
  }
}
