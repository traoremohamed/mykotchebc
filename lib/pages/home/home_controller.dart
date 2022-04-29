import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mykotche/models/infosvehicule.dart';
import 'package:mykotche/models/users.dart';
import 'package:mykotche/services/auth_service.dart';
import 'package:mykotche/utils/user_management.dart';
import 'package:get/get.dart';
/*
import 'package:native_admob_flutter/native_admob_flutter.dart';
*/

import '../../core.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
 // static HomeController to = Get.find();
  User userProfile;
  List<Car> cars = [];
  List<Dealer> dealers = [];
  Car displayCar;

  var currentUsers = Users.empty().obs;

  var infosvehicule = Infosvehicule.empty().obs;

/*
  final AppOpenAd appOpenAd = AppOpenAd()..load();
  final rewardedAd = RewardedAd()..load();
  final rewardedInterstitial = RewardedInterstitialAd()..load();
*/

  @override
  void onInit() async {
    super.onInit();
    loadData();
    /*await loadAds();*/
  }

/*  Future loadAds() async {
    appOpenAd.onEvent.listen((e) => print("==> appOpenAd.onEvent : $e"));
    rewardedAd.onEvent.listen((e) {
      print('rewarded event $e');
    });
    rewardedInterstitial.onEvent.listen((e) {
      print('rewarded interstitial event $e');
    });
  }

  Future showAppOpenAd() async {
    if (!appOpenAd.isAvailable) await appOpenAd.load();
    if (appOpenAd.isAvailable) {
      await appOpenAd.show();
      appOpenAd.load();
    }
  }*/

  @override
  void onReady() {
    informationvehiculefirst();
    super.onReady();

  }

  loadData() {
    userProfile = UserService().getProfile();
    cars = CarService().getCarList();
    dealers = DealerService().getDealerList();
    displayCar = cars[2];
    currentUsers(UserManagement.readUser());
  }

  ///Ici c'est la fonction principale A appeler
  informationvehiculefirst(){

    debugPrint("This function is ===========================================");

    AuthService InFService = AuthService();

    debugPrint("Current User Partner:::::::::::::::::::::::::::::::::-----:::: ${currentUsers.value.idPartenaire}");

    InFService.informationunseulvehicule(currentUsers.value.idPartenaire).then((response){
      int statusCode = response.statusCode;

      if(statusCode == 200){

        debugPrint("===============================================>");
        debugPrint("<<<<<<Info Vehicule>>>>>: ${response.data}");


        infosvehicule(Infosvehicule.fromJson(response.data["data"]));


      }else{
        debugPrint("error Information Veh ${response.statusCode}");
      }

    });
  }




  @override
  void onClose() {
    super.onClose();
  }
}
