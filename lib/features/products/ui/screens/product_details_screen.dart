import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quomodosoft_task/features/common/ui/widgets/search_bar_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quomodosoft_task/features/products/data/models/cars_model.dart';
import '../../../../app/app_colors.dart';
import '../../../home/ui/controller/home_screen_controller.dart';
import '../widgets/car_item_widget.dart';
import '../widgets/product_details_carousel_widget.dart';

/// Detailed Product Screen

class ProductDetailsScreen extends StatefulWidget {
  final CarsModel car;
  const ProductDetailsScreen({super.key, required this.car});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final sectionTitleStyle = textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      bottomNavigationBar: SafeArea(child: buildBottomButtons()),
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: SizedBox(height: 44, child: SearchBarWidget()),
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        actionsIconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartShopping),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel section with animation
            ZoomIn(
              duration: const Duration(milliseconds: 500),
              child: ProductDetailsCarouselWidget(
                selectedIndex: _selectedIndex,
                widget: widget,
              ),
            ),
            const Divider(thickness: 0.3),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product title and price
                  buildTitleAndPrice(textTheme),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('Brand:', style: sectionTitleStyle),
                      const SizedBox(width: 4),
                      Text(
                        widget.car.brand ?? 'Unknown',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('Description', style: sectionTitleStyle),
                  const SizedBox(height: 8),
                  Text(
                    widget.car.description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(thickness: 10, color: Colors.grey.shade100),
                  // Suggestion section title
                  const SizedBox(height: 8),
                  Text('Suggestions', style: sectionTitleStyle),
                  const SizedBox(height: 8),

                  // Suggestion grid with animation
                  buildSuggestionGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Title and price row
  Widget buildTitleAndPrice(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            widget.car.title,
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.headingColor,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              '\$${widget.car.price}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: AppColors.themeColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Suggestion product grid
  Widget buildSuggestionGrid() {
    return AnimationLimiter(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(controller.latestCars.length, (index) {
          final screenWidth = MediaQuery.of(context).size.width;
          final itemWidth = (screenWidth - 16 * 2 - 8) / 2;

          return SizedBox(
            width: itemWidth,
            height: 250,
            child: CarItemWidget(controller.latestCars[index]),
          );
        }),
      ),
    );
  }

  // Bottom buttons: Wishlist and Add to Cart
  Widget buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Wishlist button
          Expanded(
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: BorderSide(width: 2, color: AppColors.themeColor),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                child: Icon(
                  FontAwesomeIcons.heart,
                  color: AppColors.themeColor,
                  size: 24,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Add to Cart button
          Expanded(
            flex: 6,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}

