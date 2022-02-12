import 'package:get/get.dart';
import 'package:weather_app_global_test_gen5/screens/search_screen/search_controller.dart';



class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}