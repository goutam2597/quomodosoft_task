import '../../../app/assets_path.dart';

class CarDealer {
  final String name;
  final String logoPath;
  final int totalCars;
  final String phone;
  final String address;
  final bool isVerified;

  CarDealer({
    required this.name,
    required this.logoPath,
    required this.totalCars,
    required this.phone,
    required this.address,
    this.isVerified = false,
  });
}

final List<CarDealer> carDealers = [
  CarDealer(
    name: 'Beach Auto Cars',
    logoPath: AssetsPath.dealerOne,
    totalCars: 800,
    phone: '+00 23904 0248',
    address: '1901 Thornrid Cir Shiloh, Dhaka, BD',
    isVerified: true,
  ),
  CarDealer(
    name: 'ALB Cars',
    logoPath: AssetsPath.dealerTwo,
    totalCars: 720,
    phone: '+00 23904 0923',
    address: '1901 Thornrid Cir Shiloh, Dhaka, BD',
    isVerified: false,
  ),
  CarDealer(
    name: 'Beach Auto Cars',
    logoPath: AssetsPath.dealerOne,
    totalCars: 800,
    phone: '+00 23904 0248',
    address: '1901 Thornrid Cir Shiloh, Dhaka, BD',
    isVerified: true,
  ),
  CarDealer(
    name: 'ALB Cars',
    logoPath: AssetsPath.dealerTwo,
    totalCars: 720,
    phone: '+00 23904 0923',
    address: '1901 Thornrid Cir Shiloh, Dhaka, BD',
    isVerified: false,
  ),
  CarDealer(
    name: 'Beach Auto Cars',
    logoPath: AssetsPath.dealerOne,
    totalCars: 800,
    phone: '+00 23904 0248',
    address: '1901 Thornrid Cir Shiloh, Dhaka, BD',
    isVerified: true,
  ),
  CarDealer(
    name: 'ALB Cars',
    logoPath: AssetsPath.dealerTwo,
    totalCars: 720,
    phone: '+00 23904 0923',
    address: '1901 Thornrid Cir Shiloh, Dhaka, BD',
    isVerified: false,
  ),
];
