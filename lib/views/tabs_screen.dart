import 'package:flutter/material.dart';
import 'package:food_delivery/views/home/home_screen.dart';
import 'package:food_delivery/views/home/widgets/bottom_navigation_bar_widget.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs_screen';
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'خانه',
      },
      {
        'page': const HomeScreen(),
        'title': 'سبد خرید',
      },
      {
        'page': const HomeScreen(),
        'title': 'پروفایل',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBarWidget(
          onTap: _selectPage,
          selectedPageIndex: _selectedPageIndex,
        ));
  }
}
