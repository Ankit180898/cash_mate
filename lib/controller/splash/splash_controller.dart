import 'dart:async';
import 'package:cash_mate/main.dart';
import 'package:cash_mate/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () => _checkAuthentication());
  }

  Future<void> _checkAuthentication() async {
    // Initialize shared preferences

    // Get current session
    final session = supabaseC.auth.currentSession;

    if (session != null) {
      // User is authenticated 
      // Navigate to the home screen
      Get.offAllNamed(Routes.HOME);
    } else {
      // User is not authenticated

      // Navigate to the get started screen
      Get.offAllNamed(Routes.GETSTARTED);
    }
  }
}
