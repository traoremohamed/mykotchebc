import 'package:mykotche/pages/vehicule/vehicule_controller.dart';
import 'package:get/get.dart';
import '../../core.dart';

class VehiculeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<VehiculeController>(VehiculeController());
  }
}