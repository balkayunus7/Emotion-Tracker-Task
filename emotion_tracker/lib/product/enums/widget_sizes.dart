import 'package:flutter/material.dart';

enum WidgetSize {
  gridViewSpacing(25),
  fontSizeButton(11),
  fontSizeHistory(14),
  fontSizeSubtitle(20),
  fontSizeShow(17),
  fontSizeTitle(23),
  gridViewCount(3),
  crossAxisSpacing(15),
  childAspectRatio(1.4),
  mainAxisSpacing(27),
  crossAxisCount(3);

  final double value;

  // ignore: sort_constructors_first
  const WidgetSize(this.value);
}

class WidgetSizeConstants {
  static BorderRadius get borderRadiusNormal => BorderRadius.circular(10);
  static BorderRadius get borderRadiusBig => BorderRadius.circular(20);
  static EdgeInsets get navigationPadding =>
      const EdgeInsets.symmetric(horizontal: 15, vertical: 10);
}
