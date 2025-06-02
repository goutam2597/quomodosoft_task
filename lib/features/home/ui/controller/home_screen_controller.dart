import 'package:get/get.dart';

import '../../../../services/network_caller/network_caller.dart';
import '../../../products/data/models/cars_model.dart';
import '../../data/models/slider_model.dart';

/// Controller for managing home screen state and data fetching.
class HomeScreenController extends GetxController {
  var sliders = <SliderModel>[].obs;
  var latestCars = <CarsModel>[].obs;
  var featuredCars = <CarsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  /// Loads slider, latest car, and featured car data from the API.
  void loadData() async {
    try {
      isLoading.value = true;
      sliders.value = await NetworkCaller.fetchSliders();
      latestCars.value = await NetworkCaller.fetchLatestCars();
      featuredCars.value = await NetworkCaller.fetchFeaturedCars();
    } finally {
      isLoading.value = false;
    }
  }
}
