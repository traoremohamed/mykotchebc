import 'package:get/get.dart';
import '../../core.dart';
import 'code_route_controller.dart';

class CodeRouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CodeRouteController>(CodeRouteController());
  }
}
