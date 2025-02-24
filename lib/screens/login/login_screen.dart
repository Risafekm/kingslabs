// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:kingslabs/core/colors.dart';
// import 'package:kingslabs/core/style.dart';
// import 'package:kingslabs/models/user_model.dart';
// import 'package:kingslabs/provider/userprovider_signin.dart';
// import 'package:kingslabs/screens/login/widgets/custom_button.dart';
// import 'package:kingslabs/screens/login/widgets/text_area.dart';
// import 'package:provider/provider.dart';

// import '../dashboard/homescreen.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   String errorMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: formKey,
//         child: Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ), // Adjusts the padding based on the keyboard
//           child: SingleChildScrollView(
//             // Allows scrolling of content
//             child: Column(
//               children: [
//                 const SizedBox(height: 250),
//                 TextArea(
//                   keyboardType: TextInputType.text,
//                   name: 'User Name',
//                   controller: nameController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'please enter number';
//                     } else {
//                       return null;
//                     }
//                   },
//                   suffixIcon: const Icon(
//                     Icons.abc,
//                     color: AppColors.transColor,
//                   ),
//                   obscureText: false,
//                   prefixIcon: const Icon(
//                     Icons.person,
//                     color: AppColors.accentColor1,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextArea(
//                   keyboardType: TextInputType.text,
//                   name: 'Password',
//                   controller: passwordController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'please enter password';
//                     } else {
//                       return null;
//                     }
//                   },
//                   suffixIcon: const Icon(
//                     Icons.abc,
//                     color: AppColors.transColor,
//                   ),
//                   obscureText: false,
//                   prefixIcon: const Icon(
//                     Icons.lock,
//                     color: AppColors.accentColor1,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Row(
//                   children: [
//                     const Spacer(),
//                     InkWell(
//                       onTap: () {},
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 40.0),
//                         child: Text(
//                           'Change Password?',
//                           style: AppStyles.bodyText,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Consumer<UserproviderSignin>(
//                   builder: (context, userProvider, child) {
//                     return userProvider.isLoading
//                         ? const CircularProgressIndicator()
//                         : CustomButton(
//                             text: 'LOGIN',
//                             onpressed: () async {
//                               if (nameController.text.isEmpty ||
//                                   passwordController.text.isEmpty) {
//                                 // Show snackbar with error message if email or password is empty
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     backgroundColor: AppColors.actionColor2,
//                                     content: Text(
//                                         'Email and password cannot be empty'),
//                                   ),
//                                 );
//                                 return; // Exit the method early
//                               }

//                               // Proceed with authentication if email and password are not empty
//                               UserModel user = UserModel(
//                                 username: nameController.text,
//                                 password: passwordController.text,
//                               );

//                               // Call the addData method to authenticate the user
//                               await Provider.of<UserproviderSignin>(
//                                 context,
//                                 listen: false,
//                               ).addData(user.username, user.password, context);

//                               // Check if authentication was successful
//                               if (Provider.of<UserproviderSignin>(
//                                 context,
//                                 listen: false,
//                               ).isAuthenticated) {
//                                 // Navigate to the Dashboard page
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const HomeScreen(),
//                                   ),
//                                 );
//                               } else {
//                                 // Show error message for incorrect credentials
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     backgroundColor: AppColors.actionColor2,
//                                     content:
//                                         Text('Incorrect username or password'),
//                                   ),
//                                 );
//                               }
//                             },
//                           );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
