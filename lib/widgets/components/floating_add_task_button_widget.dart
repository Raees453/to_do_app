import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/models/event.dart';
import 'package:flutter_to_do_app/models/event_category.dart';
import 'package:flutter_to_do_app/providers/events_provider.dart';
import 'package:provider/provider.dart';

class FloatingAddTaskButtonWidget extends StatelessWidget {
  FloatingAddTaskButtonWidget({Key? key}) : super(key: key);

  EventCategory category = EventCategory.noCategory;

  final List<Widget> subTasks = [];
  final _titleController = TextEditingController();
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: const Icon(Icons.add),
      onPressed: () => _onPressed(context),
    );
  }

  _onPressed(BuildContext context) async {
    final provider = Provider.of<EventsProvider>(context, listen: false);

    await showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      context: context,
      builder: (ctx) => ChangeNotifierProvider.value(
        value: provider,
        child: _getBottomSheetComponent(context),
      ),
    );
  }

  _getBottomSheetComponent(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.tertiary,
      ),
    );

    return StatefulBuilder(
      builder: (_, setState) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      enabledBorder: border,
                      errorBorder: border,
                      disabledBorder: border,
                      hintText: 'Input new Task here',
                      fillColor: Theme.of(context).colorScheme.tertiary,
                      filled: true,
                    ),
                    controller: _titleController,
                    maxLines: 2,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
                  if (subTasks.isNotEmpty)
                    SizedBox(
                      height: 100,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: ListView(
                          children: subTasks,
                        ),
                      ),
                    )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  PopupMenuButton(
                    color: Theme.of(context).backgroundColor,
                    itemBuilder: (_) =>
                        _getCategoriesDropDown(context, setState),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Chip(
                      label: Text(
                        category.name == 'noCategory'
                            ? 'NO CATEGORY'
                            : category.name.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      date = (await _getDate(context))!;
                    },
                    icon: const Icon(Icons.calendar_today_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      _addSubTask(setState, context);
                    },
                    icon: const Icon(Icons.account_tree),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.note_alt_outlined),
                  ),
                  const Spacer(),
                  RotatedBox(
                    quarterTurns: 3,
                    child: FloatingActionButton(
                      onPressed: () => _addTask(context),
                      child: const Icon(
                        Icons.send,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _getCategoriesDropDown(
    BuildContext context,
    void Function(void Function()) setState,
  ) {
    const values = EventCategory.values;

    return values
        .map((e) => PopupMenuItem<EventCategory>(
              child: Text(
                e.name == 'noCategory' ? 'NO CATEGORY' : e.name.toUpperCase(),
                style: e.name == 'noCategory'
                    ? TextStyle(color: Theme.of(context).colorScheme.secondary)
                    : const TextStyle(),
              ),
              onTap: () => setState(() => category = e),
            ))
        .toList();
  }

  Future<DateTime?> _getDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2100, 1, 1),
    );

    if (date == null) {
      print('Date is null');
      return null;
    }

    final dateNow = DateTime.now();
    print('Date: ${date.toString()}');

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateNow.hour, minute: dateNow.minute),
    );

    if (time == null) {
      return date;
    }
    date = date.add(Duration(hours: time.hour, minutes: time.minute));
    return date;
  }

  int _value = 0;

  _addSubTask(setState, context) {
    setState(
      () => subTasks.add(
        RadioListTile(
          value: subTasks.length + 1,
          groupValue: _value,
          onChanged: (value) => setState(() {
            print('Changed! $value');
            _value = value as int;
          }),
          activeColor: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  _addTask(context) async {
    final event = Event(
      id: DateTime.now().toString(),
      title: _titleController.text.trim(),
      date: date,
      category: category,
    );

    await Provider.of<EventsProvider>(context, listen: false)
        .insertEvent(event);
  }
}
