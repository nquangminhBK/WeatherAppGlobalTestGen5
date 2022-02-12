import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

const bool IS_LOG = true;

Log(msg) {
  if (IS_LOG) {
    print(msg);
  }
}

String string(text) {
  String txt = "";
  if (text != false && text != null) {
    txt = text;
  }
  return txt;
}

class Utils {
  static final instance = Utils();
  late Timer timer;

  configLoading() {
    EasyLoading.instance
    // ..displayDuration = const Duration(milliseconds: 2000)
      ..boxShadow = <BoxShadow>[]
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 50.0
    // ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Color(0xFFFFFFFF)
      ..textColor = Colors.yellow
      ..maskColor = Colors.black.withOpacity(0.2)
      ..userInteractions = false
      ..dismissOnTap = false;
  }


  showLoading() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.custom,
    );
  }

  hideLoading() {
    EasyLoading.dismiss(animation: true);
  }


  toastSuccess(title) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Color(0xFFFf2edff),
        fontSize: 16.0);
  }

  toastError(title) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  toastNormal(title) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Color(0xFF6E7B8B),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<bool> checkPermission() async{
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
    }
    return true;
  }

  int convertToFahrenheit(int degree){
    return (degree*1.8 + 32).toInt();
  }
  String getIconUrl(String state){
    String base = "assets/icons";
    return "$base/$state.svg";
  }



}
