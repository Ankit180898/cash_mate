import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog {
  static confirmAdmin({
    required String title,
    required String message,
    required void Function() onConfirm,
    required void Function() onCancel,
    required TextEditingController controller,
  }) {
    Get.defaultDialog(
      title: "",
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: const TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: TextStyle(
                    color: secondarySoft,
                    height: 150 / 100,
                  ),
                ),
              ],
            ),
          ),
          CustomInput(
            margin: const EdgeInsets.only(bottom: 24),
            controller: controller,
            label: 'password',
            hint: '*************',
            obsecureText: true,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: onCancel,
                    child: Text(
                      "cancel",
                      style: TextStyle(color: secondarySoft),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      primary: primaryExtraSoft,
                      elevation: 0,
                      onPrimary: primary,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    child: const Text("confirm"),
                    style: ElevatedButton.styleFrom(
                      primary: primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static showPresenceAlert({
    required String title,
    required String message,
    required void Function() onConfirm,
    required void Function() onCancel,
  }) {
    Get.defaultDialog(
      title: "",
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: const TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 32, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: TextStyle(
                    color: secondarySoft,
                    height: 150 / 100,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: onCancel,
                    child: Text(
                      "cancel",
                      style: TextStyle(color: secondarySoft),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      primary: primaryExtraSoft,
                      elevation: 0,
                      onPrimary: primary,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    child: const Text("confirm"),
                    style: ElevatedButton.styleFrom(
                      primary: primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
