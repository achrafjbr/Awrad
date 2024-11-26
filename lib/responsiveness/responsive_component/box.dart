import 'package:flutter/material.dart';
import 'dimensions.dart';

/// Making a responsive [SizedBox] widget,because it's often used in multiple project area.
class Box {
  /// This is like a SizedBox, But it's responsive.
  /// Using it for making distance between widgets neither Vertical or Horizontal.
  static SizedBox setBox({
    required BuildContext context,
    Widget? child,
    double height = 0.0,
    double width = 0.0,
  }) {
    return SizedBox(
      // Get a responsive width with help of media query.
      width: Dimensions.setWidth(
        context: context,
        width: width,
      ),
      // Get a responsive width height help of media query.
      height: Dimensions.setHeight(
        context: context,
        height: height,
      ),
      child: child,
    );
  }

  static SizedBox verticalBox({
    required BuildContext context,
    Widget? child,
    double height = 0.0,
  }) {
    return SizedBox(
      height: Dimensions.setHeight(
        context: context,
        height: height,
      ),
      child: child,
    );
  }

  static SizedBox horizontalBox({
    required BuildContext context,
    Widget? child,
    double width = 0.0,
  }) {
    return SizedBox(
      height: Dimensions.setWidth(
        context: context,
        width: width,
      ),
      child: child,
    );
  }
}
