import 'package:cash_mate/config/app_color.dart';
import 'package:cash_mate/controller/home_controller/home_controller.dart';
import 'package:cash_mate/utils/image_constants.dart';
import 'package:cash_mate/utils/size_helpers.dart';
import 'package:cash_mate/view/home/components/top_bar_contents.dart';
import 'package:cash_mate/view/home/components/transaction_list.dart';
import 'package:cash_mate/widgets/user_info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    debugPrint("email: ${controller.userEmail}");
    return Scaffold(
      backgroundColor: AppColor.primarySoft,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FloatingActionButton(onPressed: (){},child: ImageConstants(colors: AppColor.secondaryExtraSoft).plus,backgroundColor: AppColor.primary,),
      ),
      body: Obx(
        () => Column(
          children: [
            TopBarContents(username: controller.userName.toString(), avatarUrl: "https://avatar.iran.liara.run/public/boy"),
            UserInfoCard(size: displayHeight(context)*0.10),
            Expanded(child: SegmentedButtonExample())
          ],
        ),
      ),
    );
  }
}
