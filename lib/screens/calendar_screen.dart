import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/widgets/components/calendar_widget.dart';

class CalendarScreen extends StatefulWidget {
  static const String route = '/calendar-screen';

  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: const SafeArea(
        child: Center(
          child: CalendarWidget(),
        ),
      ),
      // floatingActionButton: const FloatingAddTaskButtonWidget(),
    );
  }
}
