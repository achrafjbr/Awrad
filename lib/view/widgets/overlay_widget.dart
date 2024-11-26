
import 'package:flutter/material.dart';

import '../../responsiveness/responsive_component/dimensions.dart';

class OverlayWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? margin;

  const OverlayWidget({
    super.key,
    required this.height,
    required this.width,
    this.color,
    this.borderRadius,
    this.child,
    this.padding,
    this.alignment,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      height: Dimensions.setHeight(context: context, height: height),
      width: Dimensions.setWidth(context: context, width: width),
      padding: padding,
      alignment: alignment,
      margin: margin,
      child: child,
    );
  }
}
