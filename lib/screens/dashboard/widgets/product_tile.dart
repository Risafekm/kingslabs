import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        height: 350,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.network(
              product.images[0],
              height: 140,
              width: 180,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported, size: 130),
            ),

            // Product Title
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Text(
                product.title,
                maxLines: 2,
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Main Price
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Text(
                "\$${product.price}",
                maxLines: 1,
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 142, 40, 225),
                    decoration: TextDecoration.lineThrough,
                  ),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // Offer Price
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Text(
                "\$${product.discountPercentage}",
                maxLines: 1,
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 93, 103, 211),
                  ),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            // Rating Star
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Row(
                children: List.generate(
                  5,
                  (starIndex) => Icon(
                    Icons.star,
                    size: 14,
                    color:
                        starIndex < product.rating ? Colors.amber : Colors.grey,
                  ),
                ),
              ),
            ),

            // Location
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Row(
                children: [
                  const Icon(Icons.location_on, size: 12, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    product.category.name,
                    maxLines: 1,
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Availability
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Text(
                "Available: ${product.stock}",
                maxLines: 1,
                style: GoogleFonts.lora(
                  textStyle: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
