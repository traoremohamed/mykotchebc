import 'package:get/get.dart';

import '../../core.dart';

class SearchController extends GetxController {
  List<Car> cars = [];
  List<NewService> services = [];
  List<Dealer> dealers = [];

  @override
  void onInit() {
    super.onInit();
    cars = CarService().getCarList();
    services = ServicesService().getServiceList();
    dealers = DealerService().getDealerList();
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
