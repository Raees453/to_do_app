import 'package:flutter/material.dart';

class FirstDayOfWeekDialogue extends StatefulWidget {
  const FirstDayOfWeekDialogue({Key? key}) : super(key: key);

  @override
  State<FirstDayOfWeekDialogue> createState() => _FirstDayOfWeekDialogueState();
}

class _FirstDayOfWeekDialogueState extends State<FirstDayOfWeekDialogue> {
  int _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 3,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: const Text('First Day of Week'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildRadioButtonOf('System Default', 0),
          _buildRadioButtonOf('Monday', 1),
          _buildRadioButtonOf('Sunday', 2),
          _buildRadioButtonOf('Saturday', 3),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Save',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildRadioButtonOf(String text, int value) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      leading: Radio(
        value: value,
        activeColor: Theme.of(context).colorScheme.secondary,
        groupValue: _groupValue,
        onChanged: (val) {
          setState(() => _groupValue = val as int);
        },
      ),
      title: Text(text),
    );
  }
}
