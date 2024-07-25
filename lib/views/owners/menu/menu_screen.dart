import 'package:flutter/material.dart';
import 'package:food_delivery/views/owners/menu/menu_items.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 15, // spacing between rows
        crossAxisSpacing: 15, // spacing between columns
      ),
      padding: const EdgeInsets.all(20), // padding around the grid
      itemCount: 8, // total number of items
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MenuItems();
            }));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            // color of grid items
            child: const Center(
              child: Text(
                'drinks',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
