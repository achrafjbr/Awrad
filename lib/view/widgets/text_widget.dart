import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection textDirection;
  final FontStyle? textFontStyle;
  final BoxFit textFit;

  final Color? textColor;
  final double? textFontSize;
  final FontWeight? textFontWeight;

  const TextWidget({
    super.key,
    required this.title,
    this.textAlign,
    this.textOverflow,
    this.textDirection = TextDirection.ltr,
    this.textColor,
    this.textFontSize,
    this.textFontStyle,
    this.textFit = BoxFit.contain,
    this.textFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      softWrap: true,
      overflow: textOverflow,
      textWidthBasis: TextWidthBasis.parent,
      textDirection: textDirection,
      style: TextStyle(
        color: textColor,
        fontWeight: textFontWeight,
        fontStyle: textFontStyle,
        fontSize: textFontSize,
      ),
    );
  }
}
