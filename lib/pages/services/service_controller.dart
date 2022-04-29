import 'package:get/get.dart';
/*
import 'package:native_admob_flutter/native_admob_flutter.dart';
*/

import '../../core.dart';

class ServiceController extends GetxController {
/*
  final interstitialAd =
*/
/*
      InterstitialAd(unitId: AdSetUnitId.interstitialAdUnitId);
*/

  @override
  void onInit() {
    super.onInit();
/*
    if (!interstitialAd.isLoaded) interstitialAd.load();
*/
    /*interstitialAd.onEvent.listen((e) {
      final event = e.keys.first;
      print("==>> event : $event");
      switch (event) {
        case FullScreenAdEvent.closed:
          // Here is a handy place to load a new interstitial after displaying the previous one
          interstitialAd.load();
          // Do not show an ad here
          break;
        default:
          break;
      }
    });*/
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    /*if (!interstitialAd.isAvailable) await interstitialAd.load();
    if (interstitialAd.isAvailable) {
      await interstitialAd.show();

      /// You can also load a new ad here, because the `show()` will
      /// only complete when the ad gets closed
      // interstitialAd.load();
    }*/
    super.onClose();
  }
}
