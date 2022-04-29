import 'package:mykotche/models/infosassurance.dart';
import 'package:mykotche/models/infosvehicule.dart';
import 'package:mykotche/models/infosvisite.dart';
import 'package:flutter/material.dart';
import 'package:mykotche/shared/styles/colors.dart';
import 'package:mykotche/models/car.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

import '../../core.dart';

class BookCarView extends GetView<BookCarController> {
  final car = Get.arguments as Car;
  final f = new DateFormat('yyyy-MM-dd hh:mm');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          /*
          Container(
            color: Colors.white,
            height: 100,
            child: GetBuilder<BookCarController>(
              initState: (_) => controller.loadData(),
            ),
          ),

          */
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(context),
                    /*buildCorps(context),*/
                    buildVehicule(context),
                    buildVisite(context),
                    buildAssurance(context),
                    /*buildBody(),*/
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

  Widget buildHeader(BuildContext context) {
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
          SizedBox(height: 17),
          TitleWidget(
            title: controller.currentusers.value.name ?? "User name",
            subtitle: controller.currentusers.value.prenomUsers ?? "User surname",
          ),
          SizedBox(height: 20),
          /*ImagesWidget(
            images: ['eege'],
            isExpanded: false,
          ),*/
          SizedBox(height: 17),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPricePerPeriod(
                  context,
                  "12",
                  "4.35jt",
                  true,
                ),
                SizedBox(width: 16),
                _buildPricePerPeriod(
                  context,
                  "6",
                  "4.8jt",
                  false,
                ),
                SizedBox(width: 16),
                _buildPricePerPeriod(
                  context,
                  "1",
                  "5.1jt",
                  false,
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
        /*InkWell(
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
        ),*/
        SizedBox(width: 16),
        /*InkWell(
          onTap: () {
            Share.share('${car.model}\n${car.brand}\nPrice : \$${car.price}');
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
        ),*/
      ],
    );
  }

  Widget _buildPricePerPeriod(
      BuildContext context, String months, String price, bool selected) {
    return Container(/*
      //  width: MediaQuery.of(context).size.width,
      height: 105,
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
          /*Text(
            months + " Month",
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),*/
         /* Expanded(child: Container()),*/
          /*Text(
            price,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),*/
          /*Text(
            "IDR",
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 13,
            ),
          ),*/
        ],
      ),
    */);
  }

  Widget buildCorps(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 4,
        padding: EdgeInsets.only(
          top: 10,
          left: 16,
        ),
        margin: EdgeInsets.only(bottom: 16),
        child: Obx(
          () => ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.vehiculesList.isEmpty
                ? 0
                : controller.vehiculesList.length,
            itemBuilder: (context, index) {
              Infosvehicule vehiculeItem = controller.vehiculesList[index];
              return Container(
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                margin: EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Immatriculation
                    Text("Immatriculation vehicule"),
                    Text(
                      vehiculeItem.immatriculation,
                      style: TextStyle(color: Colors.black),
                    ),

                    ///Type de voiture

                    Text(
                      vehiculeItem.typeVehicule,
                      style: TextStyle(color: Colors.black),
                    ),

                    ///Marque vehicule
                    Text(
                      vehiculeItem.marqueVehicule,
                      style: TextStyle(color: Colors.black),
                    ),

                    ///Couleur vehicule
                    Text(
                      vehiculeItem.couleur,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  Widget buildVehicule(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Text(
                  "INFORMATION VEHICULE",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 16,
                ),
                margin: EdgeInsets.only(bottom: 16),
                child: /*Obx(()=>*/
                    ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.vehiculesList.isEmpty
                      ? 0
                      : controller.vehiculesList.length,
                  itemBuilder: (context, index) {
                    Infosvehicule vehiculeItem =
                        controller.vehiculesList[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 1.25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      margin: EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Immatriculation
                          Text(
                            "Immatriculation du vehicule",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            vehiculeItem.immatriculation,
                            style: TextStyle(color: Colors.black),
                          ),

                          ///Marque vehicule
                          Text(
                            "Marque vehicule",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            vehiculeItem.marqueVehicule,
                            style: TextStyle(color: Colors.black),
                          ),

                          ///Type de voiture
                          Text(
                            "Type de vehicule",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            vehiculeItem.typeVehicule,
                            style: TextStyle(color: Colors.black),
                          ),

                          ///Couleur vehicule
                          Text(
                            "Couleur vehicule",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            vehiculeItem.couleur,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                /*)*/
              ),
            ],
          ),
        ));
  }

  Widget buildVisite(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                "iNFORMATION VISITE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 16,
                ),
                margin: EdgeInsets.only(bottom: 16),
                child:
                //On met le OBX ou il y'a l'objet observable. Ici c'est la liste qui est observable donc OBX sur le Listview.builder
                Obx(
                      () => ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.visitesList.isEmpty
                        ? 0
                        : controller.visitesList.length,
                    itemBuilder: (context, index) {
                      Infosvisite visiteItem = controller.visitesList[index];

                      return Container(
                        width: MediaQuery.of(context).size.width / 1.25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        margin: EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///Immatricualtion vehicule
                            Text(
                              "Immatriculation vehicule",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              visiteItem.immatriculation,
                              style: TextStyle(color: Colors.black),
                            ),
                            ///Date dernier visite
                            Text(
                              "Date dernier visite",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            // on peut pas formater la date la ?
                            // C'est comme ca qu'elle vient 2022-02-14 15:41:31 ?
                            //oui oui
                            // ok
                            Text(
                                DateFormat.yMMMMEEEEd().format(visiteItem.dateDernierVisite.toLocal())
                            ),
                            /*Text(
                                DateTime.parse(visiteItem.dateDernierVisite.toString()).toLocal(),
                              style: TextStyle(color: Colors.black),
                            ),*/

                            ///Date prochain visite
                            Text(
                              "Date prochaine visite",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.yMMMMEEEEd().format(visiteItem.dateVisiteProchain),
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
            ),
          ],
        ),
    );
  }

  Widget buildAssurance(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Text(
                  "iNFORMATION ASSURANCE",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: EdgeInsets.only(
                  top: 10,
                  left: 16,
                ),
                margin: EdgeInsets.only(bottom: 16),
                child: /*Obx(()=>*/
                    ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.assurancesList.isEmpty
                      ? 0
                      : controller.assurancesList.length,
                  itemBuilder: (context, index) {
                    Infosassurance assuranceItem =
                        controller.assurancesList[index];
                    //Infosvehicule vehiculeItem = controller.vehiculesList[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 1.25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      margin: EdgeInsets.only(right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Nom de l'assurance
                          Text(
                            "Nom de l'assurance",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            assuranceItem.libelleAssurance,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Immatriculation vehicule",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            assuranceItem.immatriculation,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Date dernier assurance",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd().format(assuranceItem.dateExpirationAssurance),
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Date expiration assurance",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd().format(assuranceItem.dateRappelAssurance),
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                /*)*/
              ),
            ],
          ),
        ));
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
              "SPECIFICATIONS",
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
                _buildSpecificationCar("Color", "White"),
                _buildSpecificationCar("Gearbox", "Automatic"),
                _buildSpecificationCar("Seat", "4"),
                _buildSpecificationCar("Motor", "v10 2.0"),
                _buildSpecificationCar("Speed (0-100)", "3.2 sec"),
                _buildSpecificationCar("Top Speed", "121 mph"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationCar(String title, String data) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 2),
          Text(
            data,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 18),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Text(
                "12 Month",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),*/
              SizedBox(height: 4),
              Row(
                children: [
                  /*Text(
                    "IDR 4,35jt",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),*/
                  SizedBox(width: 8),
                  /*Text(
                    "per month",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),*/
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () => {
              OpenDialog.confirm(
                content: "Voulez vous ajouter un vehicule?",
                lottieFilename: "thinking",
                onYesClicked: () {
                  Get.toNamed(Routes.VEHICULE);  //es ce que c'est pas du a ca ?
                  // Le Get.offAllNamed : il supprime tout et ne laisse que la route a atteindre
                  //Le Get.toNamed conserve la route precedente et va sur la suivante
                },
              ),

              // UserManagement.logoutUser().whenComplete(() => Get.toNamed(Routes.LOGIN));
            },
            /*OpenDialog.info(
                lottieFilename: LottieFileName.COMING_SOON,
                lottiePadding: EdgeInsets.only(top: 50))*/
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
                    "Ajouter un vehicule",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
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
