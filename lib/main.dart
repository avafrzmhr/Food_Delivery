import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/data/repository/location_repository.dart';
import 'package:food_delivery/data/source/location_source.dart';
import 'package:food_delivery/providers.dart';
import 'package:food_delivery/views/customers/home/bottom_navigation_provider.dart';
import 'package:food_delivery/views/customers/auth/get_mobile/auth_screen.dart';
import 'package:food_delivery/views/location/bloc/location_bloc.dart';
import 'package:food_delivery/views/location/location_provider.dart';
import 'package:food_delivery/views/tabs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AuthScreen(),
      ),
    );
  }
}
