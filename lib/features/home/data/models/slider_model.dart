/// Model class representing a single slider item.
class SliderModel {
  final String image; // Image path of the slider

  SliderModel({required this.image});

  /// Factory constructor to create a [SliderModel] from JSON data.
  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(image: json['image']); // Assign image from JSON key
  }
}
