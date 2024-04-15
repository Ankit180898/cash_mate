// Image constants for image assets.
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ImageConstants {
  // static String icon = 'assets/icon.png';
  static var success = const Icon(Iconsax.tick_circle);
  static var failure = const Icon(Iconsax.info_circle);
  static var settings = const Icon(Icons.settings);
  static var home = const Icon(Iconsax.home);
  static var profile = const Icon(Iconsax.profile);
  static var search = const Icon(Iconsax.search_normal);
  static var trash = const Icon(Iconsax.trash);
  static var income = const Icon(Iconsax.money_recive1);
  static var expense = const Icon(Iconsax.money_send1);
  static var avatar = const Icon(Iconsax.camera);
  static var leftArrow = const Icon(Iconsax.arrow_left);
  static var rightArrow = const Icon(Iconsax.arrow_right);

  static const List<String> imagesSlider = [
    'assets/1.svg',
    'assets/2.svg',
    'assets/3.svg',
    'assets/4.svg'
  ];
}
