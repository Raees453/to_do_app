import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/models/event.dart';
import 'package:flutter_to_do_app/providers/events_provider.dart';
import 'package:flutter_to_do_app/widgets/components/chip_widget.dart';
import 'package:flutter_to_do_app/widgets/components/empty_event_list_widget.dart';
import 'package:flutter_to_do_app/widgets/components/event_tile_widget.dart';
import 'package:flutter_to_do_app/widgets/components/floating_add_task_button_widget.dart';
import 'package:provider/provider.dart';

import '../models/event_category.dart';
import '../widgets/components/to_do_search_delegate.dart';

class TasksScreen extends StatefulWidget {
  static const String route = '/tasks-screen';

  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final _listOptions = [
    'Manage Categories',
    'Search',
    'Sort By',
    'Print',
    'Upgrade to PRO'
  ];

  // final _actions=[
  //   _search,
  // ];

  final _chipsList = [
    'All',
    'Work',
    'Personal',
    'Wishlist',
    'Birthday',
  ];

  final _chipsSelectedList = [
    true,
    false,
    false,
    false,
    false,
  ];

  List<Event>? todayEvents;
  List<Event>? completedEvents;
  List<Event>? pendingEvents;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _init();
  }

  _init() async {
    final provider = Provider.of<EventsProvider>(context);
    await provider.fetchEvents();
    todayEvents = provider.events;
    completedEvents = provider.completedEvents;
    pendingEvents = provider.pendingEvents;
  }

  bool showToday = true;
  bool showTomorrow = false;
  bool showLater = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: SafeArea(
          child: todayEvents == null || todayEvents!.isEmpty
              ? const EmptyEventListWidget()
              : Column(
                  children: [
                    const SizedBox(height: 20),
                    _getTodayHeadingText(),
                    const SizedBox(height: 20),
                    _getTomorrowHeadingText(),
                    const SizedBox(height: 20),
                    _geFutureHeadingText(),
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingAddTaskButtonWidget(),
    );
  }

  _search() async {
    await showSearch(
      context: context,
      delegate: ToDoSearchDelegate(todayEvents!),
    );
  }

  _getDayButton(String text, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Text(text),
            const SizedBox(width: 10),
            Icon(
              showToday ? Icons.arrow_drop_down : Icons.arrow_drop_up,
            ),
          ],
        ),
      ),
    );
  }

  _getTodayHeadingText() {
    return Column(
      children: [
        _getDayButton('Today', () {
          setState(() {
            showToday = !showToday;
          });
        }),
        if (showToday)
          ListView.builder(
            itemCount: todayEvents!.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (_, index) =>
                EventTileWidget(todayEvents!.elementAt(index)),
          ),
      ],
    );
  }

  _getTomorrowHeadingText() {
    return Column(
      children: [
        _getDayButton('Completed', () {
          setState(() {
            showTomorrow = !showTomorrow;
          });
        }),
        if (showTomorrow)
          ListView.builder(
            itemCount: completedEvents!.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (_, index) =>
                EventTileWidget(completedEvents!.elementAt(index)),
          ),
      ],
    );
  }

  _geFutureHeadingText() {
    return Column(
      children: [
        _getDayButton('Future', () {
          setState(() {
            showLater = !showLater;
          });
        }),
        if (showLater)
          ListView.builder(
            itemCount: pendingEvents!.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (_, index) =>
                EventTileWidget(pendingEvents!.elementAt(index)),
          ),
      ],
    );
  }

  _filterEventsByCategory(int index, EventCategory? category) {
    setState(() {
      int size = _chipsSelectedList.length;
      _chipsSelectedList.removeRange(0, _chipsSelectedList.length);
      for (int i = 0; i < size; i++) {
        _chipsSelectedList.add(false);
      }

      _chipsSelectedList[index] = !_chipsSelectedList[index];

      todayEvents = Provider.of<EventsProvider>(context, listen: false)
          .filterByCategory(category);
      completedEvents = Provider.of<EventsProvider>(context, listen: false)
          .filterCompletedTasksByCategory(category);
      pendingEvents = Provider.of<EventsProvider>(context, listen: false)
          .filterPendingTasksByCategory(category);
    });
  }

  _getChips() {
    final list = List.generate(
      4,
      (index) => ChoiceChipWidget(
        selected: _chipsSelectedList[index + 1],
        label: _chipsList[index + 1],
        onSelected: (value) => _filterEventsByCategory(
          index + 1,
          EventCategory.values[index + 1],
        ),
      ),
    );

    list.insert(
      0,
      ChoiceChipWidget(
        selected: _chipsSelectedList[0],
        label: 'All',
        onSelected: (value) => _filterEventsByCategory(0, null),
      ),
    );

    return list;
  }

  _getActions() {
    return [
      PopupMenuButton(
        elevation: 3,
        position: PopupMenuPosition.under,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        itemBuilder: (_) => <PopupMenuEntry>[
          PopupMenuItem(
            child: TextButton(
              onPressed: _search,
              child: Text(
                'Search',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          )
        ],
        icon: const Icon(Icons.more_vert),
      )
    ];
  }

  _buildAppBar() {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _getChips(),
              ),
            ),
          ),
        ],
      ),
      actions: _getActions(),
    );
  }
}
