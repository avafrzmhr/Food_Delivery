import 'package:flutter/material.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final TextEditingController controller;
  final String label;
  const AuthTextFieldWidget({
    super.key,
    required this.controller,
    required this.constraints,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        width: constraints.maxWidth * 0.75,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            label: Text(label),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
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
