import 'package:cash_mate/main.dart';
import 'package:cash_mate/widgets/toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../routes/app_pages.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  var nameC = TextEditingController();
  var imageUrl = ''.obs;
    RxString selectedAvatarUrl = ''.obs;

  @override
  void dispose() {
    super.dispose();
    emailC.dispose();
    passwordC.dispose();
    nameC.dispose();
  }

  Future<void> register() async {
    if (emailC.text.isNotEmpty &&
        passwordC.text.isNotEmpty &&
        nameC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        AuthResponse res = await supabaseC.auth
            .signUp(password: passwordC.text, email: emailC.text);
        isLoading.value = false;

        // insert registered user to table users
        await supabaseC.from("Users").insert({
          "name": nameC.text,
          "email": emailC.text,
          "created_at": DateTime.now().toIso8601String(),
          "uid": res.user!.id,
          "url": imageUrl
        });

        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        isLoading.value = false;
        CustomToast.errorToast("Error", e.toString());
      }
    } else {
      CustomToast.errorToast("ERROR", "Email, password and name are required");
    }
  }
}
