import 'package:flutter/material.dart';
import 'package:kingslabs/provider/userprovider_signin.dart';
import 'package:kingslabs/screens/dashboard/homescreen.dart';
import 'package:provider/provider.dart';
import 'provider/productprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserproviderSignin()),
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
      home: HomeScreen(),
      // home: LoginScreen(),
    );
  }
}
