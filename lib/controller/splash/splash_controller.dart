import 'dart:async';
import 'package:cash_mate/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(const Duration(seconds: 2), () => Get.offAllNamed(Routes.GETSTARTED));
  }
}
