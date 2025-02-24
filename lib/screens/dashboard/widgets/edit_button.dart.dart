import 'package:flutter/material.dart';
import 'package:kingslabs/core/colors.dart';
import 'package:kingslabs/core/style.dart';
import 'package:kingslabs/models/product_model.dart';
import 'package:kingslabs/screens/login/widgets/custom_button.dart';

class EditProductScreen extends StatelessWidget {
  final Product product;

  const EditProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: product.title);
    final TextEditingController priceController =
        TextEditingController(text: product.price.toString());
    final TextEditingController descriptionController =
        TextEditingController(text: product.discountPercentage.toString());

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Edit Product",
          style: AppStyles.appBarTitle,
        )),
        backgroundColor: AppColors.accentColor1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.secondaryColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: editTextField(nameController, 'Product name'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: editTextField(priceController, 'Price'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child:
                  editTextField(descriptionController, 'Discount percentage'),
            ),
            SizedBox(height: 30),
            CustomButton(
              onpressed: () {
                Navigator.pop(context);
              },
              text: 'Save Changes',
            ),
          ],
        ),
      ),
    );
  }

  TextFormField editTextField(
      TextEditingController nameController, String text) {
    return TextFormField(
      controller: nameController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: true,
      keyboardType: TextInputType.none,
      style: AppStyles.bodyText,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        fillColor: AppColors.secondaryColor,
        filled: true,
        label: Text(
          text,
          style: AppStyles.bodyText,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.accentColor1,
            width: 2,
          ),
        ),
        labelStyle: AppStyles.bodyText,
        prefixIconColor: AppColors.actionColor1,
        suffixIconColor: AppColors.transColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.accentColor1,
            width: 2,
          ),
        ),
      ),
    );
  }
}
