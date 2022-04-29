import 'dart:async';

import 'package:mykotche/models/users.dart';
import 'package:mykotche/routes/app_pages.dart';
import 'package:mykotche/services/auth_service.dart';
import 'package:mykotche/utils/user_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VehiculeController extends GetxController {
  TextEditingController tecImmatriculation = TextEditingController();
  TextEditingController tecMarque = TextEditingController();
  TextEditingController tecCouleur = TextEditingController();
  TextEditingController tecTypeVehicule = TextEditingController();
  TextEditingController tecDatederniervisite = TextEditingController();
  TextEditingController tecDateprochainvisite = TextEditingController();
  TextEditingController tecDaterappelprochainvisite = TextEditingController();
  TextEditingController tecLibelleassurance = TextEditingController();
  TextEditingController tecDatedernierassurance = TextEditingController();
  TextEditingController tecDateprochianassurance = TextEditingController();
  TextEditingController tecDaterappelprochianassurance = TextEditingController();
  TextEditingController tecIdpersonne = TextEditingController();

  var currentusers = Users.empty().obs;

  var statusCodeVehicule = 0.obs;
  var isClickOnVehicule = false.obs;

  Timer timerLog;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() {
    currentusers(UserManagement.readUser());
  }

  DateTime now = DateTime.now();

  //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

  creationvehicule() {

    isClickOnVehicule(true);

    timerLog = Timer.periodic(Duration(seconds: 7),(_){});


    AuthService CrService = AuthService();

    CrService.comptevehicule(
            tecImmatriculation.text,
            tecMarque.text,
            tecCouleur.text,
            tecTypeVehicule.text,
            tecDatederniervisite.text,
            tecDateprochainvisite.text,
            tecDaterappelprochainvisite.text,
            tecLibelleassurance.text,
            tecDatedernierassurance.text,
            tecDateprochianassurance.text,
            tecDaterappelprochianassurance.text,
            currentusers.value.idPartenaire)
        .then((response) {

    //  int statusCode = response.statusCode;

      statusCodeVehicule(response.statusCode);

      if (statusCodeVehicule.value == 200) {
        isClickOnVehicule(false);
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

        Get.toNamed(Routes.BOOK_CAR);
      } else {
        debugPrint("error ${response.statusCode}");
        Get.snackbar("MyKotche", "Error ${statusCodeVehicule.value} Probleme de creation de vehicule");
        isClickOnVehicule(false);
      }
    });
  }
}
