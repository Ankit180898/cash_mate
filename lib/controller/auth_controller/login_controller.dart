import 'package:cash_mate/main.dart';
import 'package:cash_mate/widgets/toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../widgets/dialog/custom_dialog.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  var emailC = TextEditingController();
  var passwordC = TextEditingController();

  Future<bool?> login() async {
    if (emailC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await supabaseC.auth
            .signInWithPassword(email: emailC.text, password: passwordC.text);
        isLoading.value = false;
        Get.offAllNamed(Routes.HOME);

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
