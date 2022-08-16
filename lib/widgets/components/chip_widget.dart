import 'package:flutter/material.dart';

class ChoiceChipWidget extends StatelessWidget {
  const ChoiceChipWidget({
    required this.selected,
    required this.label,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final selected, label, onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: selected,
      label: Text(label),
      onSelected: onSelected,
      selectedColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
