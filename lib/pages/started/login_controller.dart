import 'dart:async';
import 'dart:developer';

import 'package:mykotche/core.dart';
import 'package:mykotche/models/users.dart';
import 'package:mykotche/routes/app_pages.dart';
import 'package:mykotche/services/auth_service.dart';
import 'package:mykotche/utils/user_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{


  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPassword = TextEditingController();

  var statusCodelogin = 0.obs;
  var isClickOnLogin = false.obs;

  Timer timerLog;


  @override
  void onInit() {

    Users currentUser = UserManagement.readUser();

    if(currentUser != null && !currentUser.id.isNull){
      //Aller à MainView
      debugPrint("Current user exists");
      Get.offAllNamed(Routes.HOME);
    }else{
      debugPrint("No current user exists");
    }
    super.onInit();
  }

  connexion(){
    isClickOnLogin(true);

    timerLog = Timer.periodic(Duration(seconds: 5),(_){});

    AuthService aService = AuthService();

    aService.login(tecEmail.text, tecPassword.text).then((response){

      statusCodelogin(response.statusCode);

      if(statusCodelogin.value == 200){
        isClickOnLogin(false);
        //Prendre data sur user
        debugPrint("Incoming data");
        debugPrint("=======================================================================");

        Users users = Users.fromJson(response.data['informationuser']);

        timerLog.cancel();
        UserManagement.saveUser(users).whenComplete(() => Get.offAndToNamed(Routes.HOME));


      }else{
        debugPrint("error ${response.statusCode}");
        Get.snackbar("MyKotche", "Error ${statusCodelogin.value} Probleme de connexion");
        isClickOnLogin(false);
      }

    });

  }
}