import 'package:flutter/material.dart';
import 'package:food_delivery/views/customers/home/bottom_navigation_provider.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final void Function(int) onTap;
  const BottomNavigationBarWidget({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<BottomNavigationProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.4),
          unselectedIconTheme: const IconThemeData(opacity: 0.5),
          selectedIconTheme: const IconThemeData(opacity: 1),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                size: 30,
                Icons.person,
                color: Colors.white,
              ),
              label: 'پروفایل',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                size: 30,
                Icons.shopping_bag_rounded,
                color: Colors.white,
              ),
              label: 'سبد خرید',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                size: 30,
                Icons.home_rounded,
                color: Colors.white,
              ),
              label: 'خانه',
            ),
          ],
          backgroundColor: Colors.black.withOpacity(0.8),
          currentIndex: provider.selectedIndex,
          onTap: onTap,
        ),
      ),
    );
  }
}
