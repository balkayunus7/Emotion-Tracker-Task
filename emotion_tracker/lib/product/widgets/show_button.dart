// * Buy Button of Car Details Page
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../constants/color_constants.dart';
import '../enums/widget_sizes.dart';

class ShowButton extends StatelessWidget {
  const ShowButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.horizontalNormal,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => ColorConstants.negativeEmotionsColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: context.border.normalBorderRadius,
            ),
          ),
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: double.infinity,
          height: 25,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: ColorConstants.primaryWhite,
                fontSize: WidgetSize.fontSizeShow.value,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
