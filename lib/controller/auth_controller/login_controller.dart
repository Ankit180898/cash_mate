import 'package:cash_mate/main.dart';
import 'package:cash_mate/widgets/bottom_navigation.dart';
import 'package:cash_mate/widgets/toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailC.dispose();
    passwordC.dispose();
  }

  Future<bool?> login() async {
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await supabaseC.auth
            .signInWithPassword(email: emailC.text, password: passwordC.text);

        isLoading.value = false;
        Get.offAll(const BottomNav());

        return true;
      } catch (e) {
        isLoading.value = false;
        CustomToast.errorToast('Error', e.toString());
      }
    } else {
      CustomToast.errorToast("ERROR", "Email and password are required");
    }
    return null;
  }
}
