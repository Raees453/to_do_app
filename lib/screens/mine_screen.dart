import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/models/completed_events.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/events_provider.dart';
import '../utils/utils.dart';
import '../widgets/components/pending_tasks_widget.dart';

class MineScreen extends StatefulWidget {
  static const String route = '/mine-screen';

  const MineScreen({Key? key}) : super(key: key);

  @override
  State<MineScreen> createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  var events, _toolTip;
  DateTime dateTime = DateTime(2022, 8, 7);

  @override
  void initState() {
    events =
        Provider.of<EventsProvider>(context, listen: false).completedEvents;
    _toolTip = TooltipBehavior(
      enable: true,
      builder: (
        _,
        dynamic point,
        __,
        ___,
        ____,
      ) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Events Completed: ${point.y.toString()}',
            style: const TextStyle(color: Colors.black),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                      radius: 50,
                      child: const Icon(
                        Icons.person_outline_outlined,
                        size: 70,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Raees Ali',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        subtitle: const Text('Click to login'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Tasks Overview',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: _getSmallBox(
                          context,
                          'Completed Tasks',
                          '${Provider.of<EventsProvider>(context, listen: false).totalCompletedEventsCount}',
                        ),
                        flex: 4,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _getSmallBox(
                          context,
                          'Pending Tasks',
                          '${Provider.of<EventsProvider>(context, listen: false).totalPendingEventsCount}',
                        ),
                        flex: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                _getGraphBox(context),
                const SizedBox(height: 10),
                _getNext7Days(context),
                const SizedBox(height: 10),
                PendingTasksWidget(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getSmallBox(BuildContext context, String heading, String num) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Text(
            num,
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            heading,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox()
        ],
      ),
    );
  }

  _getGraphBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).colorScheme.secondary,
      ),
      height: 300,
      padding: const EdgeInsets.all(12.0),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text('Daily Tasks Completion'),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () => changeDate(false),
                icon: const Icon(Icons.skip_previous),
              ),
              Text(Utils.formatDate(dateTime)),
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () => changeDate(true),
                icon: const Icon(Icons.skip_next),
              ),
            ],
          ),
          Expanded(
            child: SfCartesianChart(
              plotAreaBackgroundColor: Colors.transparent,
              series: [
                LineSeries<CompletedEvent, int>(
                  dataSource: events,
                  xValueMapper: (event, _) => event.dateTime.day,
                  yValueMapper: (event, _) => event.length,
                  enableTooltip: true,
                ),
              ],
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                minorGridLines: const MinorGridLines(width: 1),
              ),
              tooltipBehavior: _toolTip,
              plotAreaBorderColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  _getNext7Days(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).colorScheme.secondary,
      ),
      height: 50,
      padding: const EdgeInsets.all(12.0),
      width: double.infinity,
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text('Tasks in Next 7 days'),
      ),
    );
  }

  void changeDate(bool isAfter) {
    setState(() {
      dateTime = isAfter
          ? dateTime.add(const Duration(days: 7))
          : dateTime.subtract(const Duration(days: 7));
    });
  }
}
