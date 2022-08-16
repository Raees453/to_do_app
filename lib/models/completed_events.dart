import 'event.dart';

class CompletedEvent {
  DateTime dateTime;
  List<Event> events = [];

  CompletedEvent(this.dateTime, this.events);

  addEvent(Event event) {
    events.add(event);
  }

  get length => events.length;
}
