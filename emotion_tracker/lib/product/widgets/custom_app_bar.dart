import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import 'texts/title_text.dart';

class CustomAppBar extends PreferredSize {
  const CustomAppBar(
    this.title, {
    super.key,
    required super.preferredSize,
    required super.child,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: TitleText(
        title: title,
        color: ColorConstants.primaryDark,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
