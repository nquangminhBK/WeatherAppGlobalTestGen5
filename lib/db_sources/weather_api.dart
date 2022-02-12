
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app_global_test_gen5/configs/api_config.dart';
import 'package:weather_app_global_test_gen5/consts/api_consts.dart';
import 'package:weather_app_global_test_gen5/models/locations.dart';
import 'package:weather_app_global_test_gen5/models/weather_response.dart';
import 'package:weather_app_global_test_gen5/utils/utils.dart';


class WeatherApi {
  Utils utils = Get.put(Utils());

  Future<List<Locations>?> searchLocationByTitle(String title) async {
    final customDio = await AppDio.getInstance()
        .getAppDio();
    final response =
    await customDio.sendGetRequest("$SEARCH_LOCATION_BY_TITLE$title", {}, false);
    Log(response);
    try {
      List<Locations> data = [];
      response.data.forEach((v) {
        data.add(Locations.fromJson(v));
      });
      return data;
    } catch (e) {
      return null;
    }
  }
  Future<List<Locations>?> searchLocationByPosition(Position position) async {
    final customDio = await AppDio.getInstance()
        .getAppDio();
    final response =
    await customDio.sendGetRequest("$SEARCH_LOCATION_BY_POSITION${position.latitude},${position.longitude}", {}, false);
    Log(response);
    try {
      List<Locations> data = [];
      response.data.forEach((v) {
        data.add(Locations.fromJson(v));
      });
      return data;
    } catch (e) {
      return null;
    }
  }
  Future<WeatherResponse?> getWeatherByWoeid(int id) async {
    final customDio = await AppDio.getInstance()
        .getAppDio();
    final response =
    await customDio.sendGetRequest("$GET_WEATHER_BY_WOEID$id", {}, false);
    Log(response);
    //try {
      WeatherResponse res = WeatherResponse.fromJson(json.decode(response.toString()));
      return res;
    //} catch (e) {
      return null;
    //}
  }
}