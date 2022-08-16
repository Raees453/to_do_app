import 'package:flutter/material.dart';

class DateFormatDialogue extends StatefulWidget {
  const DateFormatDialogue({Key? key}) : super(key: key);

  @override
  State<DateFormatDialogue> createState() => _DateFormatDialogue();
}

class _DateFormatDialogue extends State<DateFormatDialogue> {
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
      title: const Text('Time Format'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildRadioButtonOf('2022/08/11', 0),
          _buildRadioButtonOf('11/08/2022', 1),
          _buildRadioButtonOf('08/11/2022', 2),
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
