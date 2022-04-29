import 'package:get/get.dart';
import '../../core.dart';
import 'appel_urgence_controller.dart';

class AppelUregnceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppelUregnceController>(AppelUregnceController());
  }
}
