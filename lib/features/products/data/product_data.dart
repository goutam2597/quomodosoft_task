import '../../../app/assets_path.dart';

enum ProductCategory { featured, popular, newProduct }

class Product {
  final List<String> image;
  final String name;
  final double price;
  final ProductCategory category;
  final String? brand;
  final String description;
  final double rating;
  final int reviews;

  Product({
    required this.image,
    required this.name,
    required this.price,
    required this.category,
    this.brand,
    required this.description,
    required this.rating,
    required this.reviews,
  });
}

class ProductData {
  static final List<Product> _products = [
    // Featured Products
    Product(
      brand: 'Chevrolet',
      image: [AssetsPath.pcar1],
      name: '2015 Chevrolet Corvette Z51',
      price: 105000,
      category: ProductCategory.featured,
      description:
          'Experience the thrill of the 2015 Chevrolet Corvette Z51. A perfect blend of power and precision, ideal for speed lovers. Comes with upgraded suspension, Brembo brakes, and a stylish aerodynamic design.',
      rating: 4.8,
      reviews: 232,
    ),
    Product(
      brand: 'Audi',
      image: [AssetsPath.pcar2],
      name: '2018 Audi TT Prestige Coupe',
      price: 110000,
      category: ProductCategory.featured,
      description:
          'The Audi TT Prestige Coupe 2018 is engineered with elegance and performance. Features a turbocharged engine, luxurious interiors, and Quattro all-wheel drive for dynamic control.',
      rating: 4.7,
      reviews: 198,
    ),
    Product(
      brand: 'Lexus',
      image: [AssetsPath.pcar3],
      name: '2021 Lexus GS F Performance',
      price: 125000,
      category: ProductCategory.featured,
      description:
          'Drive with unmatched performance in the Lexus GS F. Powered by a V8 engine and built for luxury, it delivers a refined ride and cutting-edge safety features for a confident drive.',
      rating: 4.9,
      reviews: 215,
    ),
    Product(
      brand: 'Mazda',
      image: [AssetsPath.pcar4],
      name: '2019 Mazda MX-5 Grand Touring',
      price: 100500,
      category: ProductCategory.featured,
      description:
          'Enjoy open-road freedom with the 2019 Mazda MX-5. Lightweight, agile, and responsive, this convertible is perfect for spirited drives with its SKYACTIV-G engine and soft-top roof.',
      rating: 4.6,
      reviews: 174,
    ),
    Product(
      brand: 'Mercedes-Benz',
      image: [AssetsPath.pcar5],
      name: '2017 Mercedes-Benz A-Class AMG',
      price: 123000,
      category: ProductCategory.featured,
      description:
          'Luxury meets performance with the Mercedes-Benz A-Class AMG. It combines sporty handling, AMG styling, and premium tech like MBUX for a truly exhilarating experience.',
      rating: 4.8,
      reviews: 256,
    ),
    Product(
      brand: 'Ford',
      image: [AssetsPath.pcar6],
      name: '2022 Ford Mustang GT Premium',
      price: 119000,
      category: ProductCategory.featured,
      description:
          'Rule the road in the 2022 Ford Mustang GT Premium. Comes with a roaring V8 engine, customizable drive modes, and an iconic design that embodies American muscle heritage.',
      rating: 4.9,
      reviews: 310,
    ),
    Product(
      brand: 'Honda',
      image: [AssetsPath.pcar1],
      name: '2020 Honda Civic Sport Plus',
      price: 102000,
      category: ProductCategory.featured,
      description:
          'Sporty, reliable, and efficient — the 2020 Honda Civic Sport Plus is perfect for urban drivers. Features bold styling, advanced infotainment, and Honda Sensing® safety suite.',
      rating: 4.6,
      reviews: 193,
    ),
    Product(
      brand: 'Volkswagen',
      image: [AssetsPath.pcar2],
      name: '2016 Volkswagen Golf R-Line',
      price: 108000,
      category: ProductCategory.featured,
      description:
          'The Golf R-Line blends practicality with performance. Its turbocharged engine, ergonomic design, and sporty trims offer a balanced experience for everyday commutes.',
      rating: 4.5,
      reviews: 158,
    ),


    Product(
      brand: 'BMW',
      image: [AssetsPath.pcar3],
      name: '2019 BMW i8 Ultimate Hybrid',
      price: 135000,
      category: ProductCategory.popular,
      description:
          'The BMW i8 is a futuristic plug-in hybrid sports car that combines efficiency with exhilarating performance. Designed for both thrill and sustainability.',
      rating: 4.9,
      reviews: 250,
    ),
    Product(
      brand: 'Toyota',
      image: [AssetsPath.pcar4],
      name: '2020 Toyota Supra GR Series',
      price: 112000,
      category: ProductCategory.popular,
      description:
          'The Toyota Supra GR delivers turbocharged power and race-bred handling. It’s a modern classic with a bold design and thrilling agility.',
      rating: 4.8,
      reviews: 210,
    ),

    // More products follow...
    // You can use similar 4-line descriptions and ratings for the rest as needed.
  ];

  static List<Product> get featuredProducts =>
      _products.where((p) => p.category == ProductCategory.featured).toList();

  static List<Product> get popularProducts =>
      _products.where((p) => p.category == ProductCategory.popular).toList();

  static List<Product> get newProducts =>
      _products.where((p) => p.category == ProductCategory.newProduct).toList();

  static List<Product> get allProducts => List.unmodifiable(_products);
}
