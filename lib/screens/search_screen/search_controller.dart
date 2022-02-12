import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather_app_global_test_gen5/db_sources/weather_api.dart';
import 'package:weather_app_global_test_gen5/models/locations.dart';
import 'package:weather_app_global_test_gen5/screens/home_screen/home_controller.dart';
import 'package:weather_app_global_test_gen5/utils/utils.dart';

class SearchController extends GetxController {
  Rx<List<Locations>?> listCity = Rx<List<Locations>?>([]);
  HomeController homeController = Get.put(HomeController());

  @override
  void onInit() {
    super.onInit();
  }

  onChangeTextSearch(text) async {
    List<Locations>? listLocationResponse =
        await WeatherApi().searchLocationByTitle(text);
    if (listLocationResponse != null) {
      listCity.value = listLocationResponse;
      update();
    }
  }

  onClickItem(Locations locations) async {
    Get.back();
    Utils.instance.showLoading();
    homeController.currentLocation.value = locations;
    var weather = await WeatherApi().getWeatherByWoeid(locations.woeid!);
    if (weather != null) {
      homeController.currentLocationWeather.value = weather;
      homeController.imageBackground.value = homeController.getImageBackground();
      homeController.update();
    }
    Utils.instance.hideLoading();

  }
}
