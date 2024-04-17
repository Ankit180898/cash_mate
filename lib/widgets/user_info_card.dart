import 'package:cash_mate/config/app_color.dart';
import 'package:cash_mate/utils/image_constants.dart';
import 'package:cash_mate/utils/size_helpers.dart';
import 'package:cash_mate/utils/utils.dart';
import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Container(
        width: displayWidth(context),
        height: displayHeight(context) / 4,
        decoration: BoxDecoration(
            border: Border.all(
                color: AppColor.secondaryExtraSoft.withOpacity(0.15), width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(28),
            gradient: AppColor.primaryGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            children: [
              verticalSpace(8),
              const Text(
                "Total Balance",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              verticalSpace(8),
              const Text(
                r'''$9844.00''',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Row(
                    children: [
                      IconButton.filled(onPressed: null, icon:ImageConstants(colors: AppColor.success).income,color:Colors.black.withOpacity(0.15) ,)
                       ,
                       horizontalSpace(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          Text("Income",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          verticalSpace(8),
                          const Text(
                            r'''$9844.00''',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton.filled(onPressed: null, icon: ImageConstants(colors: AppColor.warning).expense,color:Colors.black.withOpacity(0.15) ,),
                      horizontalSpace(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expense",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          verticalSpace(8),
                          const Text(
                            r'''$9844.00''',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
