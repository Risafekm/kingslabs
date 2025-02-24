// // ignore_for_file: use_build_context_synchronously
// import 'package:flutter/material.dart';
// import 'package:kingslabs/core/colors.dart';
// import 'package:kingslabs/core/style.dart';
// import 'package:kingslabs/screens/dashboard/homescreen.dart';
// import 'package:kingslabs/screens/login/login_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   Future<void> _navigateToNextScreen(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//     await Future.delayed(
//         const Duration(seconds: 2)); // Wait for the splash duration

//     if (isLoggedIn) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomeScreen()),
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _navigateToNextScreen(context);
//       // navigateScreen(context);
//     });

//     return Scaffold(
//       backgroundColor: AppColors.accentColor1,
//       body: Center(
//           child: Text(
//         "KINGS LABS",
//         style: AppStyles.bodyTextHead,
//       )),
//     );
//   }
// }
