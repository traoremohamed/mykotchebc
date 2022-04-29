import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../core.dart';
import 'auth_service.dart';

class ServicesService {
  //var serviceList = <Service>[].obs;
  List<NewService> getServiceList() {

  /*  AuthService sService = AuthService();

    sService.service().then((response){
      int statusCode = response.statusCode;

      if(statusCode == 200){
        serviceList.clear();
        var result = response.data as Map;

        result["data"].forEach((value){
          //log("Value :::::::: $value");
          Service infoservice = Service.fromJson(value);
          vehiculesList.add(infosvehicule);
        });

      }else{
        print("error ${response.statusCode}");
      }

    });*/



    return <NewService>[
      NewService(
        nom: "Chez Ali",
        type: "Garage",
        contact: 2580,
        horaires: "24/7",
        images: ["assets/images/cars/mykotche.png"],
      ),
      NewService(
        nom: "Bossia Garage",
        type: "Garage",
        contact: 3580,
        horaires: "24/7",
        images: ["assets/images/cars/mykotche.png"],
      ),
      NewService(
        nom: "Shell",
        type: "Station",
        contact: 2200,
        horaires: "24/7",
        images: ["assets/images/cars/mykotche.png"],
      ),
      NewService(
        nom: "Ivoire Assistance",
        type: "Depannage",
        contact: 3400,
        horaires: "24/6",
        images: ["assets/images/cars/mykotche.png"],
      ),
    ];
  }
}
