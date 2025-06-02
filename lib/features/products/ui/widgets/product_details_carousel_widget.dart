import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../screens/product_details_screen.dart';

/// Carousel slider widget for displaying product images in the product details screen.
class ProductDetailsCarouselWidget extends StatelessWidget {
  const ProductDetailsCarouselWidget({
    super.key,
    required ValueNotifier<int> selectedIndex,
    required this.widget,
  }) : _selectedIndex = selectedIndex;

  final ValueNotifier<int> _selectedIndex;
  final ProductDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 360,
        viewportFraction: 1,
        onPageChanged: (currentIndex, reason) {
          _selectedIndex.value = currentIndex;
        },
      ),
      items: [
        // Display the car's thumbnail image in the carousel
        Image.network(
          widget.car.thumbImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ],
    );
  }
}
