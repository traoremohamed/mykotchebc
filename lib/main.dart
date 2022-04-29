import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*import 'package:native_admob_flutter/native_admob_flutter.dart';*/
import 'core.dart';

void main() async {
  /// Make sure you add this line here, so the plugin can access the native side
  WidgetsFlutterBinding.ensureInitialized();

  /// Make sure to initialize the MobileAds sdk. It returns a future
  /// that will be completed as soon as it initializes
  /*await MobileAds.initialize(
    // nativeAdUnitId: AdSetUnitId.nativeAdUnitId,
    interstitialAdUnitId: AdSetUnitId.interstitialAdUnitId,
    appOpenAdUnitId: AdSetUnitId.appOpenAdUnitId,
    rewardedAdUnitId: AdSetUnitId.rewardedAdUnitId,
    rewardedInterstitialAdUnitId: AdSetUnitId.rewardedInterstitialAdUnitId,
  );
  await MobileAds.requestTrackingAuthorization();*/

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Kotche',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.mulishTextTheme(),
      ),
      //home: Splash2(),
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Duration(milliseconds: 230),
     // initialBinding: MainBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}


// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {

  SplashScreenController splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          //Faire un dégradé !
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/cars/mykotche.png',
                width: 120,
                height: 120,
              ),
            ),
          ),


          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 14),
              child: Column(
                children: <Widget>[
                  Text("BIENVENUE SUR MY KOTCHE", style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),),
                  Text("Votre application de suivis ", style: TextStyle(color: Colors.grey, fontSize: 12, ),),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class SplashScreenController extends GetxController{


  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time_in_app');

    if (firstTime != null && !firstTime) {
      // Not first time
      Timer(Duration(seconds: 5), () {
        Get.toNamed("/login");
      });
    } else {
      // First time
      prefs.setBool('first_time_in_app', false);
      Timer(Duration(seconds: 2), () => Get.toNamed("/login"));
    }
  }

  @override
  void onInit() {
    startTime();
    super.onInit();
  }
}