import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:weather_app_global_test_gen5/routers/app_pages.dart';
import 'package:weather_app_global_test_gen5/routers/app_routers.dart';
import 'package:weather_app_global_test_gen5/utils/utils.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Utils.instance.configLoading();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    var logger = Logger();
    logger.i("didChangeAppLifecycleState");
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        logger.i("app in resumed");
        break;
      case AppLifecycleState.inactive:
        logger.i("app in inactive");
        break;
      case AppLifecycleState.paused:
        logger.i("app in paused");
        break;
      case AppLifecycleState.detached:
        logger.i("app in detached");
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      builder: EasyLoading.init(),
      navigatorKey: Get.key,
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
