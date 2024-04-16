import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum RotationDirection { clockwise, counterclockwise }

enum StaggeredGridType { square, horizontal, vertical }

extension Direction on RotationDirection {
  bool get isClockwise => this == RotationDirection.clockwise;
}

Widget verticalSpace(double height) {
  return SizedBox(height: height);
}

Widget horizontalSpace(double width) {
  return SizedBox(width: width);
}

extension DurationExtension on int {
  Duration get s => Duration(seconds: this);
  Duration get ms => Duration(milliseconds: this);
}

Widget carouselImageSlider(List<String> images) {
  return CarouselSlider(
  
    carouselController: CarouselController(),

    items: images.map((imgUrl) {
      return Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: SvgPicture.asset(
                imgUrl,
                fit: BoxFit.scaleDown,
              ),
            ),
            
            ],
          
          );
        },
      );
    }).toList(),
    options: CarouselOptions(
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.decelerate,
    ),
  );
}
