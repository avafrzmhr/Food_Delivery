import 'package:flutter/material.dart';
import 'package:food_delivery/views/customers/auth/get_mobile/widgets/auth_textfield_widget.dart';

class TextFieldRowWidget extends StatelessWidget {
  final TextEditingController controller;
  final BoxConstraints constraints;
  final String text;
  final String suffixText;
  final double width;
  final String label;

  const TextFieldRowWidget(
      {super.key,
      required this.label,
      required this.suffixText,
      required this.controller,
      required this.constraints,
      required this.width,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AuthTextFieldWidget(
            keyboardType: TextInputType.none,
            label: label,
            width: width,
            controller: controller,
            constraints: constraints,
            suffixText: suffixText,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}
