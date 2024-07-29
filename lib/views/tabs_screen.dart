import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
import 'package:food_delivery/data/source/location_source.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/customers/auth/get_mobile/auth_screen.dart';
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
    context.read<Providers>().init();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) =>
          LocationBloc(LocationRepository(LocationDataSource())),
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            backgroundColor: Colors.white,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: 50,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    MyApp.sharedPreferences.remove('access');
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login', (Route<dynamic> route) => false);
                  },
                  child: const Text('Logout')),
            ) // Populate the Drawer in the next step.
            ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Consumer<BottomNavigationProvider>(
              builder: (context, provider, _) =>
                  _pages[provider.selectedIndex]['page'] as Widget,
            ),
            Positioned(
              top: 30,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          onTap: _selectPage,
        ),
      ),
    );
  }
}
