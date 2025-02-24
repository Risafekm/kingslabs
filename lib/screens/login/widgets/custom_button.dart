// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';
import 'package:kingslabs/core/colors.dart';
import 'package:kingslabs/core/style.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onpressed;
  String text;
  CustomButton({
    Key? key,
    required this.onpressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * .7,
        decoration: BoxDecoration(
            color: AppColors.actionColor1,
            borderRadius: BorderRadius.circular(20)),
        child: ElevatedButton(
            onPressed: onpressed,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.accentColor2),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: Text(
              text,
              style: AppStyles.buttonText,
            )),
      ),
    );
  }
}
