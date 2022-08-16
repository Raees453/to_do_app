import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/widgets/settingsCards/date_format_dialogue.dart';
import 'package:flutter_to_do_app/widgets/settingsCards/first_day_of_week_dialogue.dart';
import 'package:flutter_to_do_app/widgets/settingsCards/time_format_dialogue.dart';

import '../../utils/utils.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = '/settingsCards-screen';

  SettingsScreen({Key? key}) : super(key: key);

  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Settings'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            _getHeadingText('Customize'),
            const SizedBox(height: 10),
            _getTextButtonOf('Account Sync', Icons.person, context, () {
              print('Pressed');
            }),
            _getTextButtonOf(
              'Widget',
              Icons.widgets,
              context,
              () {},
            ),
            _getTextButtonOf(
              'Notification & Reminder',
              Icons.notifications,
              context,
              () {},
            ),
            _getTextButtonOf(
              'Theme',
              Icons.brush,
              context,
              () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _getTextButtonOf(
                    'Task Completion Tone',
                    Icons.vibration,
                    context,
                    () {},
                  ),
                ),
                StatefulBuilder(
                  builder: (_, setState) => Switch.adaptive(
                    value: _value,
                    onChanged: (value) {
                      setState(() => _value = value);
                    },
                    activeColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _getHeadingText('Date & Time'),
            const SizedBox(height: 10),
            _getTileOf(
              'First Day of Week',
              'System Default',
              Icons.calendar_today_outlined,
              () async {
                await showDialog(
                  context: context,
                  builder: (_) => const FirstDayOfWeekDialogue(),
                );
              },
              context,
            ),
            _getTileOf(
              'Time Format',
              'System Default',
              Icons.timelapse,
              () async {
                await showDialog(
                  context: context,
                  builder: (_) => const TimeFormatDialogue(),
                );
              },
              context,
            ),
            _getTileOf(
              'Date Format',
              '2022/08/11',
              Icons.date_range_outlined,
              () async {
                await showDialog(
                  context: context,
                  builder: (_) => const DateFormatDialogue(),
                );
              },
              context,
            ),
            const SizedBox(height: 20),
            _getHeadingText('About'),
            const SizedBox(height: 10),
            _getTextButtonOf(
              'Feedback',
              Icons.feedback_outlined,
              context,
              Utils.onFeedbackPressed,
            )
          ],
        ),
      ),
    );
  }

  _getTextButtonOf(
    String text,
    IconData icon,
    BuildContext context,
    void Function()? onPressed,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
        size: 30,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      onTap: onPressed,
    );
  }

  _getHeadingText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromRGBO(175, 174, 174, 1),
        ),
      ),
    );
  }

  _getTileOf(
    String title,
    String? subTitle,
    IconData icon,
    void Function()? onTap,
    BuildContext context,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
        size: 35,
      ),
      title: Text(title),
      subtitle: subTitle == null ? null : Text(subTitle),
      onTap: onTap,
    );
  }
}
