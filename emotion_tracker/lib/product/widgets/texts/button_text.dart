import 'package:emotion_tracker/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../enums/widget_sizes.dart';

class ButtonText extends StatelessWidget {
  const ButtonText(
    String emotion, {
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.signikaNegative(
          fontSize: WidgetSize.fontSizeButton.value,
          fontWeight: FontWeight.w900,
          color: ColorConstants.primaryWhite),
    );
  }
}

class HistoryText extends StatelessWidget {
  const HistoryText({
    super.key,
    required this.text,
    required this.textColor,
  });
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.signikaNegative(
          fontSize: WidgetSize.fontSizeHistory.value,
          fontWeight: FontWeight.w500,
          color: textColor),
    );
  }
}
