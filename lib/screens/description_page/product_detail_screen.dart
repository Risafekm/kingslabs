import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingslabs/core/colors.dart';
import 'package:kingslabs/core/style.dart';
import '../../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          product.title,
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Image.network(
                  product.images[0],
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Product Title
              Text(
                product.title,
                style: GoogleFonts.lora(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Price
              Text(
                "Price: \$${product.price}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),

              // Product Description
              Text(
                product.description,
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
