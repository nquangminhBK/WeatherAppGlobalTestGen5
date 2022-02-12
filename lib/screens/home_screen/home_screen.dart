
import 'package:flutter/material.dart';import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_global_test_gen5/routers/app_routers.dart';
import 'package:weather_app_global_test_gen5/widgets/buildin_transform.dart';
import 'package:weather_app_global_test_gen5/widgets/single_weather.dart';
import 'package:weather_app_global_test_gen5/widgets/slider_dot.dart';
import 'package:weather_app_global_test_gen5/widgets/transformer_page_view/transformer_page_view.dart';

import 'home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (s) =>
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: Text('Hello Mindx', style: GoogleFonts.lato(fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.SEARCH);
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              body: Stack(
                children: [
                  Image.asset(
                    controller.imageBackground.value,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.black45),
                  ),
                  (controller.currentLocationWeather.value != null &&
                      controller.currentLocationWeather.value!
                          .consolidatedWeather !=
                          null)
                      ? Container(
                    margin: const EdgeInsets.only(top: 140, left: 15),
                    child: Row(
                      children: [
                        for (int i = 0;
                        i <
                            controller.currentLocationWeather.value!
                                .consolidatedWeather!.length;
                        i++)
                          if (i == controller.currentPage.value)
                            SliderDot(true)
                          else
                            SliderDot(false)
                      ],
                    ),
                  )
                      : Container(),
                  (controller.currentLocationWeather.value != null &&
                      controller.currentLocationWeather.value!
                          .consolidatedWeather !=
                          null)
                      ? TransformerPageView(
                    scrollDirection: Axis.horizontal,
                    transformer: ScaleAndFadeTransformer(),
                    viewportFraction: 0.8,
                    onPageChanged: controller.onPageChanged,
                    itemCount: controller.currentLocationWeather.value!
                        .consolidatedWeather!.length,
                    itemBuilder: (ctx, i) =>
                        SingleWeather( controller
                            .currentLocationWeather
                            .value!
                            .consolidatedWeather![i],key: UniqueKey(),),
                  )
                      : Container(),
                ],
              ),
            ));
  }
}
