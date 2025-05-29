import '../../../app/assets_path.dart';

class CarouselSlide {
  final String? title;
  final String? subtitle;
  final String carImage;
  final String? fixedBannerImage;

  CarouselSlide({
    this.title,
    this.subtitle,
    required this.carImage,
    this.fixedBannerImage,
  });
}

final List<CarouselSlide> carouselSlides = [
  CarouselSlide(
    title: 'Find Your Perfect Car',
    subtitle: 'World of Luxury Automobiles',
    carImage: AssetsPath.bannerCar,
    fixedBannerImage: AssetsPath.tBanner,
  ),
  CarouselSlide(
    carImage: AssetsPath.bannerCar,
    fixedBannerImage: AssetsPath.tBanner,
  ),
  CarouselSlide(
    title: 'Feel the Power',
    subtitle: 'Aston Martin Legacy',
    carImage: AssetsPath.bannerCar,
    fixedBannerImage: AssetsPath.tBanner,
  ),
  CarouselSlide(
    subtitle: 'Jeep Adventure Mode',
    carImage: AssetsPath.bannerCar,
    fixedBannerImage: AssetsPath.tBanner,
  ),
];
