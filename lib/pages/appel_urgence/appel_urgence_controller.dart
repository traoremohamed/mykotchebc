import 'dart:developer';

import 'package:get/get.dart';
import 'package:mykotche/models/numerourgence.dart';
import 'package:mykotche/services/auth_service.dart';


class AppelUregnceController extends GetxController {


  var myContacts = <Numerourgence>[].obs;

  @override
  void onInit() async {
    super.onInit();

  }

  @override
  void onReady() async {
    getUrgencyContactList();
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }



  void getUrgencyContactList() {

    AuthService sService = AuthService();

    sService.numerourgence().then((response){
      int statusCode = response.statusCode;

      log("===========================================================") ;
      log("Current NumUr are : ${response.data}") ;
      log("===========================================================") ;


      if(statusCode == 200){
        myContacts.clear();
        var result = response.data as Map;

        result["data"].forEach((value){
          log("Value :::::::: $value");
          Numerourgence numUr = Numerourgence.fromJson(value);
          myContacts.add(numUr);
        });

      }else{
        print("error ${response.statusCode}");
      }

    });

  }
}
