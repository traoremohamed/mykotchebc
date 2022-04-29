import 'package:mykotche/main.dart';
import 'package:mykotche/models/users.dart';
import 'package:mykotche/pages/appel_urgence/appel_urgence_binding.dart';
import 'package:mykotche/pages/appel_urgence/appel_urgence_view.dart';
import 'package:mykotche/pages/code_route/code_route_binding.dart';
import 'package:mykotche/pages/code_route/code_route_view.dart';
import 'package:mykotche/pages/vehicule/vehicule_binding.dart';
import 'package:mykotche/pages/vehicule/vehicule_controller.dart';
import 'package:mykotche/pages/vehicule/vehicule_view.dart';
import 'package:get/get.dart';
import '../core.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),

    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: Routes.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
    ),
    GetPage(
      name: Routes.AVAILABLE_CARS,
      page: () => AvailableCarsView(),
      binding: AvailableCarsBinding(),
    ),
    GetPage(
      name: Routes.BOOK_CAR,
      page: () => BookCarView(),
      binding: BookCarBinding(),
    ),
    GetPage(
      name: Routes.SERVICE,
      page: () => ServiceView(),
      binding: ServiceBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.VEHICULE,
      page: () => VehiculeView(),
      binding: VehiculeBinding(),
    ),
    GetPage(
      name: Routes.CODE_ROUTE,
      page: () => CodeRouteView(),
      binding: CodeRouteBinding(),
    ),
    GetPage(
      name: Routes.APPEL_URGENCE,
      page: () => AppelUregnceView(),
      binding: AppelUregnceBinding(),
    )
  ];
}
