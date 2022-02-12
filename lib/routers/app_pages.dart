
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weather_app_global_test_gen5/screens/home_screen/home_binding.dart';
import 'package:weather_app_global_test_gen5/screens/home_screen/home_screen.dart';
import 'package:weather_app_global_test_gen5/screens/search_screen/search_binding.dart';
import 'package:weather_app_global_test_gen5/screens/search_screen/search_screen.dart';

import 'app_routers.dart';

class AppPages {
  static const INITIAL_ROUTE = Routes.HOME;
  static final routes = [
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: Routes.SEARCH, page: () => SearchScreen(), binding: SearchBinding()),
  ];

}
