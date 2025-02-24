// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:kingslabs/core/colors.dart';
import 'package:kingslabs/core/style.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../provider/productprovider.dart';

// Dummy colors and styles. Replace with your own definitions as needed.

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data after the first frame.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context, listen: false).getData();
    });
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.accentColor1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.secondaryColor),
        ),
        title: Text('Products', style: AppStyles.appBarTitle),
        elevation: 3,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: AppColors.accentColor1),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.loadingcolor),
            );
          }
          // Check if data has been loaded
          if (provider.productModel == null) {
            return const Center(child: Text("No data found."));
          }
          // Use the products list from the loaded model.
          final List<Product> products = provider.productModel!.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                ),
                child: Card(
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        CircleAvatar(
                            backgroundColor: AppColors.accentColor1,
                            child: Image.network(product.images[0])),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.category.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.bodyText,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Discount: ${product.discountPercentage.toString()}%",
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.bodyText,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // SnackBar helper method.
  void snackbar(context, {required String text, required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Row(
          children: [
            Expanded(child: Text('Successfully $text')),
            const SizedBox(width: 20),
            const Icon(Icons.done, color: AppColors.accentColor1),
          ],
        ),
      ),
    );
  }
}
