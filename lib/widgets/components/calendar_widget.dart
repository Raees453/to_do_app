import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'event_widget.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarFormat _calendarFormat;
  late DateTime _firstDay, _focusedDay, _lastDay, _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _firstDay = DateTime.utc(2019, 1, 1);
    _lastDay = DateTime.utc(2100, 31, 12);
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: _firstDay,
            lastDay: _lastDay,
            calendarFormat: _calendarFormat,
            calendarStyle: CalendarStyle(
              weekendTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              selectedTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              todayDecoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            headerStyle: HeaderStyle(
              leftChevronIcon: Icon(
                Icons.keyboard_arrow_left,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              rightChevronIcon: Icon(
                Icons.keyboard_arrow_right,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border:
                    Border.all(color: Theme.of(context).colorScheme.onPrimary),
              ),
              formatButtonTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              headerMargin: const EdgeInsets.only(bottom: 20),
              // headerPadding: const EdgeInsets.all(8.0),
            ),
            onFormatChanged: (CalendarFormat calendarFormat) =>
                setState(() => _calendarFormat = calendarFormat),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: textStyle,
              weekendStyle: textStyle,
            ),
            onDaySelected: (DateTime selectDay, DateTime focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
                _selectedDay = selectDay;
              });
            },
            selectedDayPredicate: (DateTime selectedDate) =>
                isSameDay(selectedDate, _selectedDay),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (_, index) => const EventWidget(),
          ),
        ],
      ),
    );
  }
}
