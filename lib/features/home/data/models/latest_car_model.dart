class LatestCarModel {
  final String title;
  final String thumbImage;
  final String purpose;
  final String condition;
  final String price;
  final String? brandName;

  LatestCarModel({
    required this.title,
    required this.thumbImage,
    required this.purpose,
    required this.condition,
    required this.price,
    this.brandName,
  });

  factory LatestCarModel.fromJson(Map<String, dynamic> json) {
    return LatestCarModel(
      title: json['title'],
      thumbImage: json['thumb_image'],
      purpose: json['purpose'],
      condition: json['condition'],
      price: json['regular_price'],
      brandName: json['brand']?['name'],
    );
  }
}
