import 'package:flutter/cupertino.dart';import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app_global_test_gen5/db_sources/weather_api.dart';
import 'package:weather_app_global_test_gen5/models/locations.dart';
import 'package:weather_app_global_test_gen5/models/weather_response.dart';
import 'package:weather_app_global_test_gen5/resources/assets.dart';
import 'package:weather_app_global_test_gen5/utils/utils.dart';

class HomeController extends GetxController{
  Rx<Locations?> currentLocation = Rx<Locations?>(null);
  Rx<WeatherResponse?> currentLocationWeather = Rx<WeatherResponse?>(null);
  Rx<int> currentPage = Rx<int>(0);
  Rx<String> imageBackground = Rx<String>(clearBg);
  Rx<bool> isCelsius = Rx<bool>(true);
  @override
  void onInit() async {

    super.onInit();
    Utils.instance.showLoading();
    //WeatherApi().searchLocationByTitle("Ha");
    var position = await getInitialPosition();
    Log(position);
    if(position!= null) {
      List<Locations>? listLocationResponse = await WeatherApi().searchLocationByPosition(position);
      if (listLocationResponse!= null) {
        currentLocation.value = listLocationResponse[0];
        if(currentLocation.value!= null && currentLocation.value!.woeid!= null) {
          var weather  = await WeatherApi().getWeatherByWoeid(currentLocation.value!.woeid!);
          if(weather!= null) currentLocationWeather.value = weather;
          imageBackground.value = getImageBackground();
          update();
        }
      }
    }
    Utils.instance.hideLoading();
  }

  Future<Position?> getInitialPosition() async {
    var checkPermission = await Utils.instance.checkPermission();
    if (checkPermission){
      var res = await Geolocator.getCurrentPosition();
      return res;
    }
    return null;
  }

  changeUnit(){
    isCelsius.value = !isCelsius.value;
    update();
  }

  onPageChanged(int index){
    currentPage.value = index;
    imageBackground.value = getImageBackground();
    update();
  }
  String getImageBackground(){
    switch(currentLocationWeather.value!.consolidatedWeather![currentPage.value].weatherStateAbbr){
      case 'sn':
        return clearBg;
      case 'sl':
        return sleetBg;
      case 'h':
        return hailBg;
      case 't':
        return thunderStormBg;
      case 'hr':
        return heavyRainBg;
      case 'lr':
        return lightRainBg;
      case 's':
        return showersBg;
      case 'hc':
        return heavyCloudBg;
      case 'lc':
        return lightCloudBg;
      case 'c':
        return clearBg;
      default:
        return clearBg;
    }
  }
}