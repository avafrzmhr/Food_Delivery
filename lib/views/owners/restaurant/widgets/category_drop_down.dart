import 'package:flutter/material.dart';

class FormItemsWidget extends StatefulWidget {
  const FormItemsWidget({super.key});

  @override
  State<FormItemsWidget> createState() => _FormItemsWidgetState();
}

class _FormItemsWidgetState extends State<FormItemsWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'iranian',
      'fastfood',
      'kebab',
      'piza',
      'burger',
      'sandwich',
      'fried',
      'pasta',
      'salad',
      'marine',
      'International',
      'Gilani'
    ];
    var dropdownValue = list[0];
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropdownMenu<String>(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          initialSelection: list.first,
          onSelected: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
        const SizedBox(width: 8),
        const Text(':نوع رستوران خود را مشخص کنید'),
      ],
    );
  }
}
