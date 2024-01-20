import 'package:emotion_tracker/product/enums/widget_sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText({required this.title, required this.color, super.key});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: GoogleFonts.signikaNegative(
        color: color,
        fontSize: WidgetSize.fontSizeTitle.value,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
