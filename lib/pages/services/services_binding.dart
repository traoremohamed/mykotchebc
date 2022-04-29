import 'package:get/get.dart';
import '../../core.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ServiceController>(ServiceController());
  }
}
