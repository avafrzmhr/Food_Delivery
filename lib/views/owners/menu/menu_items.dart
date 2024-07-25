import 'package:flutter/material.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({super.key});

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drinks'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 110,
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: const Text('name'),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      child: const Text(
                        '\$55',
                        style: TextStyle(
                          color: Color.fromRGBO(48, 24, 172, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(
                        Icons.mode_edit_outline_rounded,
                        size: 30,
                        color: Color.fromRGBO(48, 24, 172, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
