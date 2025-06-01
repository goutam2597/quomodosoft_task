import 'package:flutter/material.dart';
import '../../../home/data/models/latest_car_model.dart';

class CarItemWidget extends StatelessWidget {
  final LatestCarModel car;

  const CarItemWidget(this.car, {super.key});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width / 2 - 20;

    return SizedBox(
      width: cardWidth,
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + Wishlist Icon
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 110,
                  child: Image.network(
                    "https://carbaz.mamunuiux.com/${car.thumbImage}",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Center(child: Icon(Icons.image_not_supported)),
                  ),
                ),
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
                      icon: Icon(Icons.favorite_border, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
            // Divider
            const Divider(thickness: 0.2, indent: 10, endIndent: 10),
            // Car details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.brandName ?? '',
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    car.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${car.price}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
