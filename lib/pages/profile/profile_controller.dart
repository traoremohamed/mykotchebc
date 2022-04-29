import 'package:mykotche/models/users.dart';
import 'package:mykotche/utils/user_management.dart';
import 'package:get/get.dart';

import '../../core.dart';

class ProfileController extends GetxController {
  //User userProfile;
  var currentusers = Users.empty().obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() {
    currentusers (UserManagement.readUser()) ;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
