import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../features/home/data/models/slider_model.dart';
import '../../features/products/data/models/cars_model.dart';

/// A class for making network requests to the CarBaz API.
class NetworkCaller {
  /// Base URL for all API requests.
  static const String baseUrl = 'https://carbaz.mamunuiux.com/api/';

  /// Fetches slider data from the API.
  static Future<List<SliderModel>> fetchSliders() async {
    final res = await http.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      return (data['sliders'] as List)
          .map((e) => SliderModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load sliders");
    }
  }

  /// Fetches the featured cars from the API.

  static Future<List<CarsModel>> fetchFeaturedCars() async {
    final res = await http.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      return (data['featured_cars'] as List)
          .map((e) => CarsModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load cars");
    }
  }

  /// Fetches the latest car listings from the API.

  static Future<List<CarsModel>> fetchLatestCars() async {
    final res = await http.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      return (data['latest_cars'] as List)
          .map((e) => CarsModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load cars");
    }
  }
}
