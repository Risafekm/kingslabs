import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kingslabs/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserproviderSignin extends ChangeNotifier {
  List<UserModel> _posts = [];
  List<UserModel> get posts => _posts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> addData(
      String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      print('Email and password cannot be empty');
      return;
    }

    _isLoading = true;
    notifyListeners();

    final apiUrl = Uri.parse('https://dummyjson.com/auth/login');
    final userData = UserModel(
      username: email,
      password: password,
    );

    try {
      final response = await http.post(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(userData.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['token'] != null) {
          _isAuthenticated = true;
          snackbar(context, text: 'Logged In');

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLoggedIn', true);
        } else {
          _isAuthenticated = false;
          final error = data['message'] ?? 'Authentication failed';
          snackbar(context, text: error);
        }
      } else {
        final data = jsonDecode(response.body);
        final error = data['message'] ?? 'Failed to login';
        snackbar(context, text: error);
      }
    } catch (e) {
      print('Error during login: $e');
      snackbar(context, text: 'An error occurred. Please try again.');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => LoginScreen(),
    //   ),
    // );
  }

  // SnackBar method for feedback
  snackbar(BuildContext context, {required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Row(
          children: [
            Expanded(child: Text('Successfully $text')),
            const SizedBox(width: 20),
            const Icon(Icons.done, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
