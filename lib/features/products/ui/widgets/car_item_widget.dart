import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quomodosoft_task/app/app_colors.dart';
import 'package:quomodosoft_task/features/products/ui/screens/product_details_screen.dart';
import '../../data/models/cars_model.dart';

/// A widget that displays a car item as a card with image, brand, title, and price.
class CarItemWidget extends StatelessWidget {
  final CarsModel car;

  const CarItemWidget(this.car, {super.key});

  @override
  Widget build(BuildContext context) {
    // Calculates dynamic width for responsive layout
    final double cardWidth = MediaQuery.of(context).size.width / 2 - 20;

    return InkWell(
      radius: 6,
      // Navigate to the product details screen on tap
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(car: car),
          ),
        );
      },
      child: SizedBox(
        width: cardWidth,
        child: Card(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Column(
            children: [
              // Image section with wishlist icon
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 110,
                    child: Image.network(
                      car.thumbImage, // Car thumbnail image
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Center(child: Icon(Icons.image_not_supported)),
                    ),
                  ),
                  // Wishlist heart icon positioned at top-right
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
              const Divider(thickness: 0.3, indent: 10, endIndent: 10),
              // Car details section
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Car brand
                    Text(
                      car.brand ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Car title with max lines
                    Text(
                      car.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.headingColor
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Car price
                    Text(
                      '\$${car.price}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.themeColor
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
