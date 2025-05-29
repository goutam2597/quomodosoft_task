import 'package:flutter/material.dart';
import 'package:quomodosoft_task/app/app_colors.dart';
import 'package:quomodosoft_task/app/assets_path.dart';
import 'package:quomodosoft_task/features/home/data/car_dealer_data.dart';
import 'package:quomodosoft_task/features/home/data/carousel_slides_data.dart';
import 'package:quomodosoft_task/features/home/ui/widgets/custom_carousel_widget.dart';
import 'package:quomodosoft_task/features/home/ui/widgets/dealer_widget.dart';
import 'package:quomodosoft_task/features/products/data/product_data.dart';
import 'package:quomodosoft_task/features/products/ui/widgets/product_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../widgets/category_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/home_section_header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with logo, search bar, and actions
          const HomeSectionHeaderWidget(),

          const SizedBox(height: 32),

          // Body Section
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Primary carousel slider with texts and images(method called)
                        _buildPrimaryCustomCarouselWidget(),

                        // Section: Car categories
                        FadeIn(
                          child: HeaderWidget(title: 'Popular Categories', onTap: () {}),
                        ),
                        const CarCategoryList(),

                        // Section: featured car listings
                        FadeIn(
                          child: HeaderWidget(
                            title: 'Feature Car Listings',
                            onTap: () {},
                          ),
                        ),
                        _buildHorizontalProductList(),

                        const SizedBox(height: 16),

                        // Secondary promotional carousel with image only
                        CustomCarouselWidget(
                          slides: carouselSlides,
                          height: 140,
                          itemBuilder: (context, slide) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                  image: AssetImage(slide.fixedBannerImage!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 8),

                        // Section: Top dealers list
                        FadeIn(
                          child: HeaderWidget(title: 'Top Dealers', onTap: () {}),
                        ),
                        const SizedBox(height: 8),
                        _buildDealerList(),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),

                  // promotional banner to become car dealers (method called).
                  const SizedBox(height: 16),
                  _buildJoinDealerBanner(screenWidth),
                  const SizedBox(height: 10),

                  // Car grid listing section
                  _buildCarGridSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Primary carousel slider with texts and images method
  CustomCarouselWidget<CarouselSlide> _buildPrimaryCustomCarouselWidget() {
    return CustomCarouselWidget(
      slides: carouselSlides,
      itemBuilder: (context, slide) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(6),
            image: const DecorationImage(
              image: AssetImage(AssetsPath.groupStack),
              fit: BoxFit.contain,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (slide.title != null)
                Text(
                  slide.title!,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              if (slide.subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  slide.subtitle!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 4),
              Image.asset(
                slide.carImage,
                height: 80,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ],
          ),
        );
      },
    );
  }

  // Section: Horizontal product card list
  Widget _buildHorizontalProductList() {
    return SizedBox(
      height: 220,
      child: AnimationLimiter(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ProductData.featuredProducts.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ProductWidget(product: ProductData.featuredProducts[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Section: Top dealer card list
  Widget _buildDealerList() {
    return SizedBox(
      height: 160,
      child: AnimationLimiter(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: carDealers.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: DealerWidget(dealer: carDealers[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Section: Car grid listing
  Widget _buildCarGridSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            child: HeaderWidget(title: 'Car Listings', onTap: () {}),
          ),
          const SizedBox(height: 8),
          AnimationLimiter(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ProductData.featuredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  columnCount: 2,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: ProductWidget(product: ProductData.featuredProducts[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // promotional banner to become car dealers (method).
  Widget _buildJoinDealerBanner(double screenWidth) {
    return ZoomIn(
      duration: const Duration(milliseconds: 600),
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsPath.dBanner),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Join Our Dealer',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Divider(
              endIndent: screenWidth * 0.35,
              indent: screenWidth * 0.35,
              thickness: 1.5,
              color: Colors.white,
            ),
            const Text(
              textAlign: TextAlign.center,
              'Do You Want To Car Dealer \n with Carbaz?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 160,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Become a Dealer',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
