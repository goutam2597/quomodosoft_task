import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quomodosoft_task/features/home/data/models/latest_car_model.dart';

import '../../features/home/data/models/slider_model.dart';

class NetworkCaller {
  static const String baseUrl = 'https://carbaz.mamunuiux.com/api/';

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

  static Future<List<LatestCarModel>> fetchLatestCars() async {
    final res = await http.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      final data = json.decode(res.body);
      return (data['latest_cars'] as List)
          .map((e) => LatestCarModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load cars");
    }
  }
}
