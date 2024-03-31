import 'package:flutter/material.dart';
import 'package:food_delivery/views/login/get_mobile/get_mobile_screen.dart';
import 'package:food_delivery/views/login/verify_otp/verify_otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const VerifyOTPScreen(),
    );
  }
}
