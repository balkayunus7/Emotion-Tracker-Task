import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_constants.dart';
import '../../enums/widget_sizes.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({
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
