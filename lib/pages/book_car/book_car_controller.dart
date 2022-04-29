

import 'dart:developer';

import 'package:mykotche/models/informationvehicule.dart';
import 'package:mykotche/models/infosassurance.dart';
import 'package:mykotche/models/infosvehicule.dart';
import 'package:mykotche/models/infosvisite.dart';
import 'package:mykotche/models/users.dart';
import 'package:mykotche/services/auth_service.dart';
import 'package:mykotche/utils/user_management.dart';
import 'package:get/get.dart';
/*
import 'package:native_admob_flutter/native_admob_flutter.dart';
*/

import '../../core.dart';

class BookCarController extends GetxController {
/*
  final interstitialAd =
*/
/*
      InterstitialAd(unitId: AdSetUnitId.interstitialAdUnitId);
*/

  var currentusers = Users.empty().obs;

  var vehiculesList = <Infosvehicule>[].obs;

  var visitesList = <Infosvisite>[].obs;

  var assurancesList = <Infosassurance>[].obs;

  @override
  void onInit() {
    super.onInit();
    /*if (!interstitialAd.isLoaded) interstitialAd.load();
    interstitialAd.onEvent.listen((e) {
      final event = e.keys.first;
      print("==>> event : $event");
      switch (event) {
        case FullScreenAdEvent.closed:
          // Here is a handy place to load a new interstitial after displaying the previous one
          interstitialAd.load();
          // Do not show an ad here
          break;
        default:
          break;
      }
    });*/

    loadData();
  }

  @override
  void onReady() {
    super.onReady();


    informationvehicule();
    informationvisite();
    informationassurance();
  }

  loadData() {
    currentusers(UserManagement.readUser());
  }


  ///Ici c'est la fonction principale A appeler
  informationvehicule(){

    AuthService InService = AuthService();

    print("Current User Partner:::::::::::::::::::::::::::::::::-----:::: ${currentusers.value.idPartenaire}");

    InService.informationvehicule(currentusers.value.idPartenaire).then((response){
      int statusCode = response.statusCode;

      if(statusCode == 200){
        vehiculesList.clear();
        var result = response.data as Map;

        result["data"].forEach((value){
          //log("Value :::::::: $value");
          Infosvehicule infosvehicule = Infosvehicule.fromJson(value);
          vehiculesList.add(infosvehicule);
        });

      }else{
        print("error ${response.statusCode}");
      }

    });
  }

  //OK
  informationvisite(){

    AuthService IvService = AuthService();

    print("Current User Partner:::::::::::::::::::::::::::::::::-----:::: ${currentusers.value.idPartenaire}");

    IvService.informationvisite(currentusers.value.idPartenaire).then((response){
      int statusCode = response.statusCode;

      if(statusCode == 200){
        visitesList.clear();
        var result = response.data as Map;

        result["data"].forEach((value){
          log("Value :::::::: $value");
          Infosvisite infosvisite = Infosvisite.fromJson(value);
          visitesList.add(infosvisite);
        });

      }else{
        print("error ${response.statusCode}");
      }

    });
  }

  informationassurance(){

    AuthService IaService = AuthService();

    print("Current User Partner:::::::::::::::::::::::::::::::::-----:::: ${currentusers.value.idPartenaire}");

    IaService.informationassurance(currentusers.value.idPartenaire).then((response){
      int statusCode = response.statusCode;

      if(statusCode == 200){
        assurancesList.clear();
        var result = response.data as Map;

        result["data"].forEach((value){
          log("Value :::::::: $value");
          Infosassurance infosassurance = Infosassurance.fromJson(value);
          //Infosvehicule infosvehicule = Infosvehicule.fromJson(value);
          assurancesList.add(infosassurance);
        });

      }else{
        print("error ${response.statusCode}");
      }

    });
  }

  @override
  void onClose() async {
    /*if (!interstitialAd.isAvailable) await interstitialAd.load();
    if (interstitialAd.isAvailable) {
      await interstitialAd.show();

      /// You can also load a new ad here, because the `show()` will
      /// only complete when the ad gets closed
      // interstitialAd.load();
    }*/
    super.onClose();
  }
}
