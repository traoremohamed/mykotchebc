import 'dart:developer';

import 'package:get/get.dart';
import 'package:mykotche/models/coderoute.dart';
import 'package:mykotche/services/auth_service.dart';
/*
import 'package:native_admob_flutter/native_admob_flutter.dart';
*/

class CodeRouteController extends GetxController {
/*
  final AppOpenAd appOpenAd = AppOpenAd()..load();
*/
  var myCodeRoutes = <Coderoute>[].obs;

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
    getCodeRouteList();
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }


  void getCodeRouteList() {

    AuthService sService = AuthService();

    sService.coderoute().then((response){
      int statusCode = response.statusCode;

      log("===========================================================") ;
      log("Current Road Code are : ${response.data}") ;
      log("===========================================================") ;


      if(statusCode == 200){
        myCodeRoutes.clear();
        var result = response.data as Map;

        result["data"].forEach((value){
          log("Value :::::::: $value");
          Coderoute codeR = Coderoute.fromJson(value);
          myCodeRoutes.add(codeR);
        });

      }else{
        print("error ${response.statusCode}");
      }

    });

  }
}
