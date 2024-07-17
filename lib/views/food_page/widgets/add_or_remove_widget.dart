import 'package:flutter/material.dart';

class AddOrRemoveWidget extends StatelessWidget {
  const AddOrRemoveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Card(
          shape: const CircleBorder(),
          color: Colors.grey.withOpacity(0.7),
          child: const Icon(
            Icons.remove_rounded,
            size: 30,
          ),
        ),
        const Text(
          '2',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Card(
          shape: const CircleBorder(),
          color: Colors.grey.withOpacity(0.7),
          child: const Icon(
            Icons.add_rounded,
            size: 30,
          ),
        )
      ],
    );
  }
}
