import 'package:flutter/material.dart';
import 'package:kingslabs/screens/dashboard/homescreen.dart';
import 'package:kingslabs/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'provider/productprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: LoginScreen(),
    );
  }
}
