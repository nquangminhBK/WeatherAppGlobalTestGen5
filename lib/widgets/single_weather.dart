import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_global_test_gen5/models/weather_response.dart';
import 'package:weather_app_global_test_gen5/screens/home_screen/home_controller.dart';
import 'package:weather_app_global_test_gen5/utils/utils.dart';

class SingleWeather extends GetWidget<HomeController> {
  final ConsolidatedWeather consolidatedWeather;

  const SingleWeather(this.consolidatedWeather, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Text(
                      controller.currentLocation.value!.title!,
                      style: GoogleFonts.lato(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      consolidatedWeather.applicableDate!,
                      style: GoogleFonts.lato(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.changeUnit();
                          },
                          child: Text(
                            controller.isCelsius.value
                                ? "${consolidatedWeather.minTemp!.toInt()} - ${consolidatedWeather.maxTemp!.toInt()} °C"
                                : "${Utils.instance.convertToFahrenheit(consolidatedWeather.minTemp!.toInt())} - ${Utils.instance.convertToFahrenheit(consolidatedWeather.maxTemp!.toInt())} °F",
                            style: GoogleFonts.lato(
                              fontSize: 70,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.changeUnit();
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: const Icon(
                              Icons.swap_horiz_sharp,
                              color: Colors.white,
                                  size: 40,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Utils.instance.getIconUrl(
                              consolidatedWeather.weatherStateAbbr!),
                          width: 34,
                          height: 34,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          consolidatedWeather.weatherStateName!,
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Visibility indicator:",
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${consolidatedWeather.visibility!.toInt()}",
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Wind',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${consolidatedWeather.windSpeed!.toInt()}",
                          style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'km/h',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Humidity',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${consolidatedWeather.humidity!.toInt()}",
                          style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '%',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Air press',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${consolidatedWeather.airPressure!.toInt()}",
                          style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'mBar',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Wind direc',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${consolidatedWeather.windDirection!.toInt()}",
                          style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
