import 'package:mykotche/pages/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/*
import 'package:native_admob_flutter/native_admob_flutter.dart';
*/
import '../../core.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Rechercher',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.only(
                      left: 30,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 24.0, left: 16.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      buildRecentSearch(),
                      SizedBox(height: 25),
                      Divider(
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                      ),
                      SizedBox(height: 15),
                      /*nativeAdLarge1(),*/
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecentSearch() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recherche de service",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
              Row(
                children: [
                  /*Text(
                    "view all",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),*/
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 280,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: controller.cars
                .map((car) => GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.BOOK_CAR, arguments: car);
                    },
                    child: buildCar(car, controller.cars.indexOf(car))))
                .toList(),
          ),
        ),
      ],
    );
  }

  /*Widget nativeAdLarge1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: NativeAd(
        // Large Ads
        height: 320,
        unitId: AdSetUnitId.nativeAdUnitIdSearchScreen,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 11),
            child: Material(
              elevation: 1.5,
              borderRadius: BorderRadius.circular(6),
              child: child,
            ),
          );
        },
        buildLayout: AdLayoutX.mediumAdTemplateLayoutBuilder,
        loading: Center(child: Text('Chargement en cours...')),
        error: Container(),
        icon: AdImageView(size: 40),
        headline: AdTextView(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          maxLines: 1,
        ),
        body: AdTextView(style: TextStyle(color: Colors.black), maxLines: 1),
        media: AdMediaView(
          height: 170,
          width: MATCH_PARENT,
        ),
        attribution: AdTextView(
          width: WRAP_CONTENT,
          text: 'Sponsored',
          decoration: AdDecoration(
            border: BorderSide(color: Colors.green, width: 2),
            borderRadius: AdBorderRadius.all(16.0),
          ),
          style: TextStyle(color: Colors.green),
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
        ),
        button: AdButtonView(
          elevation: 18,
          decoration: AdDecoration(
            borderRadius: AdBorderRadius.all(12),
            backgroundColor: Colors.yellowAccent[700],
          ),
          height: MATCH_PARENT,
          // textStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }*/
}
