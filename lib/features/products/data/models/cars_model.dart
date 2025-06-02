/// Model class representing car items.
class CarsModel {
  final int id;
  final String title;
  final String thumbImage;
  final String purpose;
  final String condition;
  final String price;
  final String description;
  final String address;
  final String? brand;

  CarsModel({
    required this.id,
    required this.title,
    required this.thumbImage,
    required this.purpose,
    required this.condition,
    required this.price,
    required this.description,
    required this.address,
    this.brand,
  });

  /// Factory constructor to create a [CarsModel] instance from JSON data.
  factory CarsModel.fromJson(Map<String, dynamic> json) {
    return CarsModel(
      id: json['id'],
      title: json['title'],
      thumbImage: 'https://carbaz.mamunuiux.com/${json['thumb_image']}', // image URL
      purpose: json['purpose'],
      condition: json['condition'],
      price: json['regular_price'],
      description: json['description']
          .replaceAll(RegExp(r'<[^>]*>'), '')
          .trim(),
      address: json['address'],
      brand: json['brand']?['name'],
    );
  }
}
