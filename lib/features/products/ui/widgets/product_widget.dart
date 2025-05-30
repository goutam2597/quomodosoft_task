import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quomodosoft_task/features/products/ui/screens/product_details_screen.dart';
import '../../../../app/app_colors.dart';
import '../../data/product_data.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width / 2 - 20;

    return SizedBox(
      width: cardWidth,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product),
            ),
          );
        },
        child: Card(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image with wishlist icon
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: Image.asset(
                        product.image.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Favorite icon
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.heart,
                            color: AppColors.themeColor,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Divider between image and product details
                const Divider(thickness: 0.2, indent: 10, endIndent: 10),

                // Product brand, name, and price
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Brand name
                      Text(
                        '${product.brand}',
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),

                      const SizedBox(height: 4),

                      // Product name
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Product price
                      Text(
                        '\$${product.price.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
