import 'package:cash_mate/utils/utils.dart';
import 'package:flutter/material.dart';


class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 3.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello, Himanshu",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    verticalSpace(4),
                    const Text(
                      "Balance",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/app_logo.png',
                  color: Colors.white,
                  height: 22,
                )
              ],
            ),
            verticalSpace(8),
            const Row(
              children: [
                Text(
                  r'''$9844.00''',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            verticalSpace(16),
           
          ],
        ),
      ),
    );
  }
}
