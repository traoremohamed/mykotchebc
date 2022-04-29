import 'package:flutter/material.dart';
import 'package:mykotche/shared/styles/colors.dart';
import 'package:mykotche/models/services.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core.dart';

class ServiceView extends GetView<ServiceController> {

  final service = Get.arguments as NewService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 100,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(),
                    buildBody(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildFooter(),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBar(),
          SizedBox(height: 20),
          TitleWidget(
            title: service.type,
            subtitle: service.nom,
          ),
          SizedBox(height: 20),
          ImagesWidget(
            images: service.images,
            isExpanded: false,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*_buildPricePerPeriod(
                  "12",
                  "4.35jt",
                  true,
                ),*/
                //SizedBox(width: 16),
                /* _buildPricePerPeriod(
                  "6",
                  "4.8jt",
                  false,
                ),*/
                SizedBox(width: 10),
                _buildPricePerPeriod(
                  "Evaluation",
                  "A partir de 5000 Frs , zfv eifvzef zvfezvfz ftrh hrth  hr erg  ge g ge ge gphipfefezfuuom",
                  true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBarWidget(
      actions: [
        InkWell(
          onTap: () => OpenDialog.info(
              lottieFilename: LottieFileName.COMING_SOON,
              lottiePadding: EdgeInsets.only(top: 50)),
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Icon(
              Icons.bookmark_border,
              color: Colors.white,
              size: 23,
            ),
          ),
        ),
        SizedBox(width: 16),
        InkWell(
          onTap: () {
            Share.share(
                '${service.type}\n${service.nom}\nPrice : \$${service.contact}');
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                color: Colors.grey[300],
                width: 1,
              ),
            ),
            child: Icon(
              Icons.ios_share,
              color: Colors.black,
              size: 23,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPricePerPeriod(
      String months,
      String price,
      bool selected) {
    return Expanded(
      child: Container(
        height: 95,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.grey[300],
            width: selected ? 0 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              months + " ☆☆☆☆☆ ",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: Container()),
            Text(
              price,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            /*Text(
              "IDR",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 13,
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              "SERVICES",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
              ),
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.only(
              top: 10,
              left: 16,
            ),
            margin: EdgeInsets.only(bottom: 16),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                _buildSpecificationCar(
                    "TRAITEMENT ET ENTRETIEN MOTEUR À L’HYDROGÈNE",
                    "A partir de 15000 Frs"),
                _buildSpecificationCar(
                    "MÉCANIQUE GÉNÉRALE, ENTRETIEN ET PNEUMATIQUES",
                    "A partir de 10000 Frs"),
                //_buildSpecificationCar("Seat", "4"),
                //_buildSpecificationCar("Motor", "v10 2.0"),
                // _buildSpecificationCar("Speed (0-100)", "3.2 sec"),
                //_buildSpecificationCar("Top Speed", "121 mph"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationCar(
      String title,
      String data) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      margin: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            data,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ouvert",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    "08h-18h",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "6/7",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () => launch("tel://0708114795"),
            /* onTap: () => OpenDialog.info(
                lottieFilename: LottieFileName.COMING_SOON,
                lottiePadding: EdgeInsets.only(top: 50)),*/
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Appelez",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      // fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
