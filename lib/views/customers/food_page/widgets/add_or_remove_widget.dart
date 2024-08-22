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
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_rounded),
            iconSize: 30,
          ),
        ),
        const Text(
          '0',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Card(
          shape: const CircleBorder(),
          color: Colors.grey.withOpacity(0.7),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
            iconSize: 30,
          ),
        )
      ],
    );
  }
}
