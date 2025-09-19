import 'package:flutter/material.dart';

Widget buildRadioTile({
  required String title,
  required String value,
  required String groupValue,
  required Function(String?) onChanged,
}) {
  return RadioListTile<String>(
    dense: true,
    contentPadding: EdgeInsets.zero,
    visualDensity: VisualDensity.compact,
    title: Text(title),
    value: value,
    groupValue: groupValue,
    activeColor: Colors.black,
    onChanged: onChanged,
  );
}
