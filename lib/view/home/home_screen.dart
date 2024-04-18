import 'package:cash_mate/config/app_color.dart';
import 'package:cash_mate/controller/home_controller/home_controller.dart';
import 'package:cash_mate/utils/image_constants.dart';
import 'package:cash_mate/utils/size_helpers.dart';
import 'package:cash_mate/view/home/components/keyboard_pad.dart';
import 'package:cash_mate/view/home/components/payment_screen.dart';
import 'package:cash_mate/view/home/components/top_bar_contents.dart';
import 'package:cash_mate/view/home/components/transaction_list.dart';
import 'package:cash_mate/widgets/user_info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    debugPrint("email: ${controller.userEmail}");
    return Scaffold(
      backgroundColor: AppColor.primaryExtraSoft,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _getFAB(),
      ),
      body: Obx(
        () => Column(
          children: [
            TopBarContents(
                username: controller.userName.toString(),
                avatarUrl: "https://avatar.iran.liara.run/public/boy"),
            UserInfoCard(size: displayHeight(context) * 0.10),
            Expanded(child: SegmentedButtonExample()),
          ],
        ),
      ),
    );
  }

  Widget _getFAB() {
    return SpeedDial(
      animationAngle: 20,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(size: 22),
      backgroundColor: AppColor.primary,
      visible: true,
      useRotationAnimation: true,
      curve: Curves.bounceIn,
      overlayColor: AppColor.secondaryExtraSoft,
      children: [
        // FAB 1
        SpeedDialChild(
            shape: const CircleBorder(),
            child: ImageConstants(colors: AppColor.success).income,
            backgroundColor: AppColor.primary,
            onTap: () {
              Get.to(PaymentScreen(message: "Income",isIncome: true,));
            },
            label: 'Income',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: AppColor.primary),
        // FAB 2
        SpeedDialChild(
            shape: const CircleBorder(),
            child: ImageConstants(colors: AppColor.error).expense,
            backgroundColor: AppColor.primary,
            onTap: () {
                            Get.to(PaymentScreen(message: "Expense",isIncome: false,));

            },
            label: 'Expense',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: AppColor.primary)
      ],
    );
  }
}
