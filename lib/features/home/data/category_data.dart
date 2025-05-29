import 'package:quomodosoft_task/app/assets_path.dart';

class CarCategory {
  final String title;
  final String imagePath;

  CarCategory({
    required this.title,
    required this.imagePath,
  });
}

final List<CarCategory> carCategories = [
  CarCategory(title: 'Audi', imagePath: AssetsPath.mazda),
  CarCategory(title: 'BMW', imagePath: AssetsPath.chevrolet),
  CarCategory(title: 'Aston Martin', imagePath: AssetsPath.honda),
  CarCategory(title: 'Jeep', imagePath: AssetsPath.bmw),
];
