import 'package:flutter/material.dart';

/// Reusable checkbox

class CustomCheckboxWithLabel extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckboxWithLabel({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Tapping anywhere on the row toggles the checkbox
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          // The checkbox
          Checkbox(
            value: value,
            activeColor: Colors.blue,
            side: const BorderSide(color: Colors.blue),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (v) => onChanged(v ?? false),
          ),

          // The label next to the checkbox
          Text(label),
        ],
      ),
    );
  }
}
