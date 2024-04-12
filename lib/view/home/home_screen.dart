import 'package:cash_mate/controller/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/image_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    debugPrint("email: ${controller.userEmail}");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await controller.signOut();
              },
              icon: ImageConstants.settings)
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            Text("${controller.userEmail}"),
            Text("${controller.userName}"),
            const Center(child: Text("Yes")),
          ],
        ),
      ),
    );
  }
}
