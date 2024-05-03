import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedPageIndex;
  final void Function(int)? onTap;
  const BottomNavigationBarWidget(
      {this.onTap, required this.selectedPageIndex, super.key});

  @override
  Widget build(BuildContext context) {
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
                Icons.person,
                color: Colors.white,
              ),
              label: 'پروفایل',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_rounded,
                color: Colors.white,
              ),
              label: 'سبد خرید',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                color: Colors.white,
              ),
              label: 'خانه',
            ),
          ],
          backgroundColor: Colors.black.withOpacity(0.8),
          currentIndex: selectedPageIndex,
          onTap: onTap,
        ),
      ),
    );
  }
}
