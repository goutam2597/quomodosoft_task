import 'package:get/get.dart';

import '../../../../services/network_caller/network_caller.dart';
import '../../data/models/latest_car_model.dart';
import '../../data/models/slider_model.dart';

class HomeScreenController extends GetxController {
  var sliders = <SliderModel>[].obs;
  var latestCars = <LatestCarModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    try {
      isLoading.value = true;
      sliders.value = await NetworkCaller.fetchSliders();
      latestCars.value = await NetworkCaller.fetchLatestCars();
    } finally {
      isLoading.value = false;
    }
  }
}
