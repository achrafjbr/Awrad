

import 'package:flutter/material.dart';

class Dimensions {

  static double setFontDimension({
    required BuildContext context,
    required double value,
  }) =>
      (Dimensions.getWidth(context: context) +
          Dimensions.setHeight(context: context)) /
          2 *
          value;

  static double setRadius({
    required BuildContext context,
    required double radius,
  }) =>
      (Dimensions.getWidth(context: context) +
          Dimensions.setHeight(context: context)) /
      2 *
      radius;

  /// Get screen width.
  static double getWidth({required BuildContext context}) =>
      MediaQuery.of(context).size.width;

  /// Get screen height.
  static double getHeight({required BuildContext context}) =>
      MediaQuery.of(context).size.height;

  /// set a specific width.
  static double setWidth({
    required BuildContext context,
    double width = 0.0,
  }) =>
      getWidth(context: context) * width;

  /// set a specific height.
  static double setHeight({
    required BuildContext context,
    double height = 0.0,
  }) =>
      getHeight(context: context) * height;
}
