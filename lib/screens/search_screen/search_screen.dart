import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:weather_app_global_test_gen5/consts/colors_const.dart';
import 'package:weather_app_global_test_gen5/screens/search_screen/search_controller.dart';
import 'package:weather_app_global_test_gen5/utils/utils.dart';

class SearchScreen extends GetWidget<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        builder: (s) => Scaffold(
              body: SafeArea(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 30,
                                    child: GestureDetector(
                                      child: const Icon(
                                        Icons.arrow_back,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      onTap: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, left: 20),
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color(HexColor.color_EEF2F8),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      style: TextStyle(
                                          color: Color(HexColor.color_002866),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                      autofocus: true,
                                      maxLines: 1,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.start,
                                      obscureText: false,
                                      onChanged: (text) =>
                                          {controller.onChangeTextSearch(text)},
                                      onSubmitted: (text) => {},
                                      cursorColor: Color(HexColor.color_BAC3D2),
                                      decoration: InputDecoration(
                                        counterText: '',
                                        contentPadding: const EdgeInsets.only(
                                            top: 13,
                                            bottom: 13,
                                            left: 13,
                                            right: 13),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: InputBorder.none,
                                        hintText: 'Type city name to search',
                                        hintStyle: TextStyle(
                                            color: Color(HexColor.color_002866),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        //color_EEF2F8
                                        prefixIcon: Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: const Icon(
                                            Icons.search,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                        ),
                                        prefixIconConstraints:
                                            const BoxConstraints(
                                          maxHeight: 35,
                                          maxWidth: 35,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Container(
                            width: double.infinity,
                            child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: controller.listCity.value != null
                                    ? controller.listCity.value!.length
                                    : 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                      onTap: () async {
                                        await controller.onClickItem(
                                            controller.listCity.value![index]);
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 10, top: 10, right: 10),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: color_app,
                                          ),
                                          child: Text(
                                            controller
                                                .listCity.value![index].title!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          )));
                                }),
                          ),
                        ),
                      ],
                    )),
              ),
            ));
  }
}
