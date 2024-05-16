import 'package:flutter/material.dart';
import 'package:food_delivery/views/home/bottom_navigation_provider.dart';
import 'package:food_delivery/views/home/home_screen.dart';
import 'package:food_delivery/views/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs_screen';
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': const HomeScreen(),
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
      Provider.of<BottomNavigationProvider>(context, listen: false)
          .setSelectedIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<BottomNavigationProvider>(
            builder: (context, provider, _) =>
                _pages[provider.selectedIndex]['page'] as Widget),
        bottomNavigationBar: BottomNavigationBarWidget(
          onTap: _selectPage,
        ));
  }
}
