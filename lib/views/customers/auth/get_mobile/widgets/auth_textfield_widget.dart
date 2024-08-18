import 'package:flutter/material.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final TextEditingController controller;
  final double width;
  // final String? validator;
  final TextInputType? keyboardType;
  final String label;
  final String? suffixText;
  const AuthTextFieldWidget({
    super.key,
    required this.width,
    required this.keyboardType,
    required this.controller,
    required this.constraints,
    required this.label,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(bottom: 15),
        width: width,
        child: TextFormField(
          keyboardType: keyboardType,
          // validator: (value) => validator!,
          controller: controller,
          decoration: InputDecoration(
            suffixText: suffixText,
            contentPadding: const EdgeInsets.all(15),
            label: Text(label),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 48, 24, 172),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
