import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quomodosoft_task/features/common/ui/widgets/search_bar_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../app/app_colors.dart';
import '../../data/product_data.dart';
import '../widgets/product_details_carousel_widget.dart';
import '../widgets/product_widget.dart';

/// Detailed Product Screen

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  final List<Product> productsSuggestion = ProductData.allProducts;

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
                        widget.product.brand ?? 'Unknown',
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
                    widget.product.description,
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
            widget.product.name,
            style: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.headingColor,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              '\$${widget.product.price.toStringAsFixed(0)}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: AppColors.themeColor,
              ),
            ),
            buildRatingRow(),
          ],
        ),
      ],
    );
  }

  // Rating stars and number
  Widget buildRatingRow() {
    return Row(
      children: [
        const Icon(FontAwesomeIcons.solidStar, color: Colors.amber, size: 20),
        const SizedBox(width: 8),
        Text(
          '${widget.product.rating}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade900,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '(${widget.product.reviews})',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  // Suggestion product grid
  Widget buildSuggestionGrid() {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: productsSuggestion.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 2,
            duration: const Duration(milliseconds: 400),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ProductWidget(product: productsSuggestion[index]),
              ),
            ),
          );
        },
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

// Dummy CartItem class (ensure you use your actual model in production)
class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}
