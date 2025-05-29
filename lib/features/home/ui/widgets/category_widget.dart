import 'package:flutter/material.dart';
import '../../data/category_data.dart';

/// Widget to display car category
class CategoryWidget extends StatelessWidget {
  final CarCategory category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(category.imagePath, width: 64, fit: BoxFit.contain),
          const SizedBox(height: 8),
          Text(
            category.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

/// Widget to display a horizontal scrollable list of car categories
class CarCategoryList extends StatelessWidget {
  const CarCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: carCategories.length,
        itemBuilder: (context, index) =>
            CategoryWidget(category: carCategories[index]),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
      ),
    );
  }
}
