import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
import 'package:food_delivery/data/source/location_source.dart';
import 'package:food_delivery/owner_provider.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/customers/auth/get_mobile/auth_screen.dart';
import 'package:food_delivery/views/customers/home/bottom_navigation_provider.dart';
import 'package:food_delivery/views/location/bloc/location_bloc.dart';
import 'package:food_delivery/views/location/location_provider.dart';
import 'package:food_delivery/views/owners/home/owner_home.dart';
import 'package:food_delivery/views/tabs_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyApp.sharedPreferences = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static late SharedPreferences sharedPreferences;

  static double defaultLat = 35.6997;
  static double defaultLong = 51.3380;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OwnerProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        BlocProvider(
          create: (context) =>
              LocationBloc(LocationRepository(LocationDataSource())),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Providers(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delivery App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const AuthScreen(),
        // initialRoute: '/',
        routes: {
          '/': (context) => const InitializationScreen(),
          '/login': (context) => const AuthScreen(),
          '/home': (context) => const TabsScreen(),
          '/owner': (context) => const OwnerHomeScreen(),
        },
      ),
    );
  }
}

class InitializationScreen extends StatefulWidget {
  const InitializationScreen({super.key});

  @override
  State<InitializationScreen> createState() => _InitializationScreenState();
}

class _InitializationScreenState extends State<InitializationScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      MyApp.sharedPreferences = await SharedPreferences.getInstance();
      _checkAuthStatus();
    } catch (e) {
      log('Error initializing app: $e');
    }
  }

  void _checkAuthStatus() {
    final token = MyApp.sharedPreferences.getString('access');
    log(MyApp.sharedPreferences.getString('access').toString());

    // final ownerProvider = Provider.of<OwnerProvider>(context, listen: false);
    // ownerProvider.setOwner(isOwner);
    if (token != null) {
      if (MyApp.sharedPreferences.getBool('isOwner') == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OwnerHomeScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const TabsScreen()),
        );
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
