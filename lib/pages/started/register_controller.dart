import 'dart:async';
import 'dart:developer';

import 'package:mykotche/routes/app_pages.dart';
import 'package:mykotche/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController tecNom = TextEditingController();
  TextEditingController tecPrenom = TextEditingController();
  TextEditingController tecContact1 = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecProfession = TextEditingController();
  TextEditingController tecPassword = TextEditingController();

  var statusCodeRegister = 0.obs;
  var isClickOnRegister = false.obs;

  Timer timerLog;

  creationcompte() {

    isClickOnRegister(true);

    timerLog = Timer.periodic(Duration(seconds: 5),(_){});

    AuthService rService = AuthService();

    rService
        .register(tecNom.text, tecPrenom.text, tecContact1.text, tecEmail.text,
            tecProfession.text, tecPassword.text)
        .then((response) {
     // int statusCode = response.statusCode;

      statusCodeRegister(response.statusCode);

      if (statusCodeRegister.value == 200) {
        isClickOnRegister(false);
        debugPrint("Incoming data");
        debugPrint(
            "=======================================================================");
        debugPrint(
            "=======================================================================");
        debugPrint(
            "=======================================================================");
        debugPrint(
            "=======================================================================");

        timerLog.cancel();

        Get.toNamed(Routes.LOGIN);
      } else {
        debugPrint("error ${response.statusCode}");
        Get.snackbar("MyKotche", "Error ${statusCodeRegister.value} Probleme de creation de compte");
        isClickOnRegister(false);
      }
    });
  }
}
