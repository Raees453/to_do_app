import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_to_do_app/models/event.dart';

import '../../utils/utils.dart';

class EventTileWidget extends StatefulWidget {
  const EventTileWidget(this.event, {Key? key}) : super(key: key);
  final Event event;

  @override
  State<EventTileWidget> createState() => _EventTileWidgetState();
}

class _EventTileWidgetState extends State<EventTileWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        key: UniqueKey(),
        groupTag: UniqueKey(),
        endActionPane: ActionPane(
          extentRatio: 0.7,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: 'Star',
              icon: Icons.star_border,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.all(8.0),
            ),
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Theme.of(context).colorScheme.secondary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              label: 'Date',
              icon: Icons.calendar_today_outlined,
              padding: const EdgeInsets.all(8.0),
            ),
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
              label: 'Delete',
              icon: Icons.delete,
              padding: const EdgeInsets.all(8.0),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ],
        ),
        child: ListTile(
          tileColor: Theme.of(context).colorScheme.tertiary,
          leading: IconButton(
            padding: EdgeInsets.zero,
            splashColor: Colors.transparent,
            onPressed: () => removeEvent(),
            icon: Icon(
              _isSelected ? Icons.circle : Icons.circle_outlined,
              size: 40,
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            widget.event.title,
            style: TextStyle(
              fontSize: 15,
              decoration: _isSelected
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: _isSelected
                  ? const Color.fromRGBO(175, 174, 174, 1)
                  : Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          subtitle: Text(
            Utils.formatTime(widget.event.date),
            style: TextStyle(
              color: _isSelected
                  ? const Color.fromRGBO(175, 174, 174, 1)
                  : Theme.of(context).colorScheme.error,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.flag),
          ),
        ),
      ),
    );
  }

  removeEvent() {
    {
      setState(() {
        _isSelected = !_isSelected;
        // Provider.of<EventsProvider>(context, listen: false)
        //     .removeEvent(widget.event);
      });
    }
  }
}
