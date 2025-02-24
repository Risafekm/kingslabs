// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingslabs/core/colors.dart';
import 'package:kingslabs/core/style.dart';
import 'package:kingslabs/screens/login/widgets/custom_button.dart';
import 'package:kingslabs/screens/login/widgets/text_area.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dashboard/homescreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 140),

                Text(
                  'KINGS LABS',
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 140),
                // Username field
                TextArea(
                  keyboardType: TextInputType.text,
                  name: 'User Name',
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                  suffixIcon: const Icon(
                    Icons.abc,
                    color: AppColors.transColor,
                  ),
                  obscureText: false,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.accentColor1,
                  ),
                ),
                const SizedBox(height: 20),
                // Password field
                TextArea(
                  keyboardType: TextInputType.text,
                  name: 'Password',
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  suffixIcon: const Icon(
                    Icons.abc,
                    color: AppColors.transColor,
                  ),
                  obscureText: true,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: AppColors.accentColor1,
                  ),
                ),
                const SizedBox(height: 5),
                // Change Password option
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Text(
                          'Change Password?',
                          style: AppStyles.bodyText,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Login Button
                CustomButton(
                  text: 'LOGIN',
                  onpressed: () async {
                    if (formKey.currentState!.validate()) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', true);
                      await prefs.setString('username', nameController.text);
                      print("Username saved: ${nameController.text}");

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: AppColors.actionColor2,
                          content: Text('Please enter valid credentials'),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
