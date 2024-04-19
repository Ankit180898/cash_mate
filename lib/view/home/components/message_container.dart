import 'package:cash_mate/model/country.dart';
import 'package:cash_mate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageContainer extends StatelessWidget {
   const MessageContainer({super.key});

  final double height = 50;

  final country = const Country("IN", "assets/india.svg");

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 40,
                  spreadRadius: 2,
                )
              ]),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    country.flagImageUrl,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              horizontalSpace(8),
              Text(
                country.currency,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: Container(
            height: height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 40,
                    spreadRadius: 2,
                  )
                ]),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Say Something",
                hintStyle: TextStyle(color: Colors.grey.shade300),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: height / 4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
