// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingslabs/screens/dashboard/widgets/edit_button.dart.dart';
import 'package:kingslabs/screens/dashboard/widgets/product_tile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/product_model.dart';
import '../../provider/productprovider.dart';
import '../../core/colors.dart';
import '../../core/style.dart';
import '../description_page/product_detail_screen.dart';
import '../login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).getData();
    });
  }

  // Logout
  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.accentColor1,
        title: Text('Home Screen', style: AppStyles.appBarTitle),
        elevation: 3,
        actions: [
          IconButton(
            onPressed: _logout,
            icon: Icon(
              Icons.logout,
              color: AppColors.secondaryColor,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 560,
              child: Consumer<ProductProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.loadingcolor,
                      ),
                    );
                  }
                  if (provider.productModel == null ||
                      provider.productModel!.products.isEmpty) {
                    return const Center(child: Text("No data found."));
                  }

                  final List<Product> products =
                      provider.productModel!.products;

                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(product: product),
                            ),
                          );
                        },
                        leading: Image.network(
                          product.images[0],
                          width: 80,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          product.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Price: \$${product.price}"),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditProductScreen(product: product),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Flash offer section
            Container(
              height: 420,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 190, 192, 216),
                    Color.fromARGB(255, 189, 193, 240),
                  ],
                ),
              ),
              child: Consumer<ProductProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.loadingcolor,
                      ),
                    );
                  }
                  if (provider.productModel == null ||
                      provider.productModel!.products.isEmpty) {
                    return const Center(child: Text("No data found."));
                  }

                  final List<Product> products =
                      provider.productModel!.products;

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 10,
                          top: 10,
                          bottom: 20,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 22,
                              child: Icon(
                                Icons.shopping_bag_rounded,
                                color: Colors.black87,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Flash Sales',
                                style: GoogleFonts.lora(
                                  textStyle: const TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 330,
                        child: ListView.builder(
                          // Only show a maximum of 10 items.
                          itemCount:
                              products.length > 10 ? 10 : products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ProductTile(product: product);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
