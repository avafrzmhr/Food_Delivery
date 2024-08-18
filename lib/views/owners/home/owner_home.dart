import 'package:flutter/material.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/views/owners/menu/menu_screen.dart';
import 'package:food_delivery/views/owners/restaurant/restaurant_page.dart';

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({super.key});

  @override
  State<OwnerHomeScreen> createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
        appBar: AppBar(
          title: const Text(
            'Restaurant Name',
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: Colors.purple.shade50,
                ),
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Color.fromRGBO(48, 24, 172, 1),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    Text('رستوران'),
                    Text('منو'),
                    Text('سفارش ها'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            OwnerRestaurantPage(),
            MenuScreen(),
            Center(child: Text('Orders Page')),
          ],
        ),
      ),
    );
  }
}
