import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
import 'package:food_delivery/data/source/location_source.dart';
import 'package:food_delivery/views/customers/home/bottom_navigation_provider.dart';
import 'package:food_delivery/views/customers/home/home_screen.dart';
import 'package:food_delivery/views/customers/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:food_delivery/views/location/bloc/location_bloc.dart';
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
        'page': HomeScreen(),
        'title': 'خانه',
      },
      {
        'page': HomeScreen(),
        'title': 'سبد خرید',
      },
      {
        'page': HomeScreen(),
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
    return BlocProvider(
      create: (context) =>
          LocationBloc(LocationRepository(LocationDataSource())),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Consumer<BottomNavigationProvider>(
              builder: (context, provider, _) =>
                  _pages[provider.selectedIndex]['page'] as Widget),
          bottomNavigationBar: BottomNavigationBarWidget(
            onTap: _selectPage,
          )),
    );
  }
}
