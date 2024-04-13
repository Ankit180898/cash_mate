import 'package:cash_mate/config/app_color.dart';
import 'package:cash_mate/utils/image_constants.dart';
import 'package:cash_mate/utils/size_helpers.dart';
import 'package:cash_mate/view/auth/login_screen.dart';
import 'package:cash_mate/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../utils/utils.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarySoft,
      body: Container(
        child: Column(
          children: [
            Expanded(child: carouselImageSlider(ImageConstants.imagesSlider)),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton(
                  text: "Get Started",
                  onPressed: () {
                    Get.offAllNamed(Routes.REGISTER);
                  },
                  bgcolor: AppColor.secondaryExtraSoft,
                  height: displayHeight(context) * 0.08,
                  width: displayWidth(context),
                  textSize: 16,
                  textColor: AppColor.secondary),
            )
          ],
        ),
      ),
    );
  }
}
