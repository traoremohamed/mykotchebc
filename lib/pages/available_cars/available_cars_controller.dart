import 'dart:developer';

import 'package:get/get.dart';
import 'package:mykotche/services/auth_service.dart';

import '../../models/service_used.dart';
/*
import 'package:native_admob_flutter/native_admob_flutter.dart';
*/

class AvailableCarsController extends GetxController {
/*
  final AppOpenAd appOpenAd = AppOpenAd()..load();
*/

  var myServices = <Service>[].obs;

  @override
  void onInit() async {
    super.onInit();
    /*appOpenAd.onEvent.listen((e) => print("==> appOpenAd.onEvent : $e"));
    if (!appOpenAd.isAvailable) await appOpenAd.load();
    if (appOpenAd.isAvailable) {
      await appOpenAd.show();
      appOpenAd.load();
    }*/
  }

  @override
  void onReady() async {

    getServiceList();
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }



  void getServiceList() {

    AuthService sService = AuthService();

    sService.service().then((response){
      int statusCode = response.statusCode;

      log("===========================================================") ;
      log("Current Services are : ${response.data}") ;
      log("===========================================================") ;


      if(statusCode == 200){
        myServices.clear();
        var result = response.data as Map;

        result["data"].forEach((value){
          log("Value :::::::: $value");
          Service infoservice = Service.fromJson(value);
          myServices.add(infoservice);
        });

      }else{
        print("error ${response.statusCode}");
      }

    });

  }
}
