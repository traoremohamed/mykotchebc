import 'package:flutter/material.dart';
import 'package:get/get.dart';
/*
import 'package:native_admob_flutter/native_admob_flutter.dart';
*/
import '../../core.dart';

class HomeView extends GetView<HomeController> {


  HomeController hcont = Get.put(HomeController());
 // HomeController hcont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 100,
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildHeader(),
                    buildAvailableCars(),
                    buildUtilitaires(),
                    buildAvailableAuto(),
                    buildAvailableNumero(),
                    //buildTopDeals(),
                    //buildTopDealers(),
                    //buildNativeAds(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildNativeAds() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "NATIVE ADS DEMO",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
              GestureDetector(
/*
                onTap: () async => await controller.showAppOpenAd(),
*/
                child: Row(
                  children: [
                    Text(
                      "More",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // nativeAdSmall(),
        // nativeAdLarge1(),
        // nativeAdMedium(),
        /*Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
          child: nativeAdLarge2(),
        ),*/
      ],
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
          SizedBox(height: 22),
          ImagesWidget(images: controller.displayCar.images),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Obx(()=> TitleWidget(
                  title: controller.infosvehicule.value.immatriculation.toString() ?? "Pas de vehicule",
                  subtitle: controller.infosvehicule.value.marqueVehicule.toString() ?? "veuillez enregister au moins un vehicule",
                ),),
                InkWell(
                  onTap: () => Get.toNamed(Routes.BOOK_CAR),
                  /*OpenDialog.info(
                      lottieFilename: LottieFileName.COMING_SOON,
                      lottiePadding: EdgeInsets.only(top: 50)),*/
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mon vehicule",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          size: 23,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          //SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /*AvatarWidget(
              photoURL: controller.userProfile.photoURL,
              membership: controller.userProfile.membership,
              progress: controller.userProfile.progress,
              ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /*Padding(
                      padding: const EdgeInsets.only(bottom: 2, right: 3),
                      child: Obx(() => Text(
                        //controller.currentUsers.value.name.toString(),
                        '',

                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ), ) ,
                    ),*/


                    /*Text(
                      controller.userProfile.balance,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),*/
                  ],
                ),
              ),
              /*Container(
                  //alignment: Alignment.topRight,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 23,
                  )),*/
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAvailableCars() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.AVAILABLE_CARS),
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 16, left: 16),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.all(24),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Services",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Garages, depanages, etc..",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                height: 50,
                width: 50,
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAvailableAuto() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.CODE_ROUTE),
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 16, left: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.all(24),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Code de la route",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Code de la route",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                height: 50,
                width: 50,
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAvailableNumero() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.APPEL_URGENCE),
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 16, left: 16),
        child: Container(
          decoration: BoxDecoration(
            color:  Colors.green, // Utilitaire.withRed(12),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.all(24),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Numero d'urgence",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Numero d'urgence",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                height: 50,
                width: 50,
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUtilitaires() {
    return GestureDetector(
      //onTap: () => Get.toNamed(Routes.AVAILABLE_CARS),
      child: Padding(
        padding: EdgeInsets.only(top: 20, right: 16, left: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Utilitaire,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.all(24),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Utilitaires",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Informations,coaching, etc..",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                height: 50,
                width: 50,
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopDeals() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Offres",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "Plus",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
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

  Widget buildTopDealers() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Meilleurs services",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "Plus",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
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
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          margin: EdgeInsets.only(bottom: 16),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: controller.dealers
                .map((dealer) =>
                    buildDealer(dealer, controller.dealers.indexOf(dealer)))
                .toList(),
          ),
        ),
      ],
    );
  }

/*  NativeAd nativeAdLarge1() {
    return NativeAd(
      // Large Ads
      height: 320,
      unitId: AdSetUnitId.nativeAdUnitIdHomeScreen,
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
    );
  }

  NativeAd nativeAdMedium() {
    return NativeAd(
      // Small Ads
      unitId: AdSetUnitId.nativeAdUnitIdHomeScreen,
      height: 100,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          child: Material(
            elevation: 1.5,
            borderRadius: BorderRadius.circular(17),
            child: child,
          ),
        );
      },
      buildLayout: AdLayoutX.secondBuilder,
      loading: Center(child: Text('Chargement en cours...')),
      error: Container(),
      icon: AdImageView(size: 80),
      headline: AdTextView(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        maxLines: 1,
      ),
      media: AdMediaView(height: 80, width: 120),
      button: AdButtonView(
        decoration: AdDecoration(
          borderRadius: AdBorderRadius.all(12),
          backgroundColor: Colors.yellowAccent[700],
        ),
        height: MATCH_PARENT,
      ),
    );
  }

  NativeAd nativeAdLarge2() {
    return NativeAd(
      // Large Ads
      height: 299,
      unitId: AdSetUnitId.nativeAdUnitIdHomeScreen,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          child: Material(
            elevation: 1.5,
            borderRadius: BorderRadius.circular(17),
            child: child,
          ),
        );
      },
      buildLayout: AdLayoutX.fullBuilder,
      loading: Center(child: Text('Chargement en cours...')),
      error: Container(),
      icon: AdImageView(size: 40),
      headline: AdTextView(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        maxLines: 1,
      ),
      media: AdMediaView(
        height: 180,
        width: MATCH_PARENT,
        elevation: 6,
        // elevationColor: kPrimaryColor,
      ),
      attribution: AdTextView(
        width: WRAP_CONTENT,
        height: WRAP_CONTENT,
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
        margin: EdgeInsets.only(right: 4),
        maxLines: 1,
        text: 'Sponsored',
        elevation: 1.7,
        decoration: AdDecoration(
          borderRadius: AdBorderRadius.all(8),
          border: BorderSide(color: Colors.yellowAccent[700], width: 1),
        ),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      button: AdButtonView(
        decoration: AdDecoration(
          borderRadius: AdBorderRadius.all(12),
          backgroundColor: Colors.yellowAccent[700],
        ),
        height: MATCH_PARENT,
      ),
    );
  }

  NativeAd nativeAdSmall() {
    return NativeAd(
      // Small Ads
      unitId: AdSetUnitId.nativeAdUnitIdHomeScreen,
      height: 60,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          child: Material(
            elevation: 1.3,
            borderRadius: BorderRadius.circular(4),
            child: child,
          ),
        );
      },
      buildLayout: AdLayoutX.adBannerLayoutBuilder,
      loading: Center(child: Text('Chargement en cours...')),
      error: Container(),
      icon: AdImageView(padding: EdgeInsets.only(left: 6)),
      headline: AdTextView(style: TextStyle(color: Colors.black)),
      advertiser: AdTextView(style: TextStyle(color: Colors.black)),
      body: AdTextView(style: TextStyle(color: Colors.black), maxLines: 1),
      media: AdMediaView(height: 70, width: 120),
      button: AdButtonView(
        margin: EdgeInsets.only(left: 6, right: 6),
        textStyle: TextStyle(color: Colors.black87, fontSize: 14),
        elevation: 1.7,
        elevationColor: Colors.transparent,
        decoration: AdDecoration(
          borderRadius: AdBorderRadius.all(12),
          backgroundColor: Colors.yellowAccent[700],
        ),
      ),
    );
  }*/

}
