import 'package:cash_mate/config/app_color.dart';
import 'package:cash_mate/controller/auth_controller/login_controller.dart';
import 'package:cash_mate/controller/auth_controller/register_controller.dart';
import 'package:cash_mate/utils/size_helpers.dart';
import 'package:cash_mate/utils/utils.dart';
import 'package:cash_mate/widgets/custom_button.dart';
import 'package:cash_mate/widgets/dialog/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../routes/app_pages.dart';
import '../../utils/image_constants.dart';
import '../../widgets/user_info_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondarySoft,
                  fontSize: 16),
              "Create an account?",
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: AppColor.primary, fontSize: 16),
                ))
          ],
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.only(left: 24, right: 24, top: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: const Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                verticalSpace(16),
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: displayHeight(context) * 0.20,
                        width: displayHeight(context) * 0.20,
                        child: const CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              NetworkImage('https://via.placeholder.com/150'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton.filled(
                            onPressed: () {
                              CustomAlertDialog.showPresenceAlert(title: "Choose an avatar", message: "adsd", onConfirm: (){}, onCancel: (){});
                            },
                            icon: ImageConstants.avatar,
                            iconSize: 16,
                            alignment: Alignment.center,
                          ))
                    ],
                  ),
                ),
                verticalSpace(16),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextField(
                    style: const TextStyle(fontSize: 14, fontFamily: 'poppins'),
                    maxLines: 1,
                    controller: controller.emailC,
                    decoration: InputDecoration(
                      label: Text(
                        "Name",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 14,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "John Doe",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                ),
                verticalSpace(8),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: AppColor.secondaryExtraSoft),
                  ),
                  child: TextField(
                    style: const TextStyle(fontSize: 14, fontFamily: 'poppins'),
                    maxLines: 1,
                    controller: controller.emailC,
                    decoration: InputDecoration(
                      label: Text(
                        "Email",
                        style: TextStyle(
                          color: AppColor.secondarySoft,
                          fontSize: 14,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: InputBorder.none,
                      hintText: "youremail@email.com",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondarySoft,
                      ),
                    ),
                  ),
                ),
                verticalSpace(8),
                Material(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 1, color: AppColor.secondaryExtraSoft),
                    ),
                    child: Obx(
                      () => TextField(
                        style: const TextStyle(
                            fontSize: 14, fontFamily: 'poppins'),
                        maxLines: 1,
                        controller: controller.passwordC,
                        obscureText: controller.isHidden.value,
                        decoration: InputDecoration(
                          label: Text(
                            "Password",
                            style: TextStyle(
                              color: AppColor.secondarySoft,
                              fontSize: 14,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                          hintText: "*************",
                          suffixIcon: IconButton(
                            icon: (controller.isHidden.value != false)
                                ? const Icon(Iconsax.eye)
                                : const Icon(Iconsax.eye_slash4),
                            onPressed: () {
                              controller.isHidden.value =
                                  !(controller.isHidden.value);
                            },
                          ),
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColor.secondarySoft,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(16),
                Obx(() => CustomButton(
                    text: controller.isLoading.isFalse ? "Register" : "Loading",
                    onPressed: () {
                      if (controller.isLoading.isFalse) {
                        controller.register();
                      }
                    },
                    bgcolor: AppColor.primary,
                    height: displayHeight(context) * 0.08,
                    width: displayWidth(context),
                    textSize: 16,
                    textColor: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
