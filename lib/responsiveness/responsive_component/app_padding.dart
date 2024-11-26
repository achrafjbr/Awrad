import 'package:flutter/material.dart';

import 'dimensions.dart';

/// The majority of screens has some padding vertical & horizontal.
/// This class helping to make a small padding neither 'V' Or 'H' Or both.
class AppPadding {
  /// Make a specific [Padding] Horizontal.
  /// horizontal takes [PaddingDimensions.horizontalPadding]
  static Padding horizontalPadding({
    required BuildContext context,
    Widget? child,
    double horizontal = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.setWidth(
          context: context,
          width: horizontal,
        ),
      ),
      child: child ?? const SizedBox.shrink(),
    );
  }

  /// Make a specific [Padding] Vertical.
  /// vertical takes [PaddingDimensions.verticalPadding]
  static Padding verticalPadding({
    required BuildContext context,
    required Widget child,
    double vertical = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.setHeight(
          context: context,
          height: vertical,
        ),
      ),
      child: child,
    );
  }

  /// Make a symmetricPadding neither [Vertical] or [Horizontal].
  /// horizontal takes [PaddingDimensions.horizontalPadding]
  /// vertical takes [PaddingDimensions.verticalPadding]
  static Padding symmetricPadding({
    required BuildContext context,
    required Widget child,
    double vertical = 0.0,
    double horizontal = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.setWidth(
          context: context,
          width: horizontal,
        ),
        vertical: Dimensions.setHeight(
          context: context,
          height: vertical,
        ),
      ),
      child: child,
    );
  }

  /// Make a padding from all direction neither [left], [right], [top], [bottom].
  /// !Note: need just set a percentage for  [left], [right], [top], [bottom],
  /// e.g : top : 0.23.
  static Padding onlyPadding({
    required BuildContext context,
    required Widget child,
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.setWidth(
          context: context,
          width: left,
        ),
        right: Dimensions.setWidth(
          context: context,
          width: right,
        ),
        top: Dimensions.setHeight(
          context: context,
          height: top,
        ),
        bottom: Dimensions.setHeight(
          context: context,
          height: bottom,
        ),
      ),
      child: child,
    );
  }

  /// this returned a [EdgeInsets] we can use it for example
  /// in [padding] or [margin] which are in [Container] class, or directly in [padding] attribute
  /// which is in [Padding] class
  static EdgeInsets onlyPaddingGeometry({
    required BuildContext context,
    double left = 0.0,
    double right = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.only(
      left: Dimensions.setWidth(
        context: context,
        width: left,
      ),
      right: Dimensions.setWidth(
        context: context,
        width: right,
      ),
      top: Dimensions.setHeight(
        context: context,
        height: top,
      ),
      bottom: Dimensions.setHeight(
        context: context,
        height: bottom,
      ),
    );
  }

  static EdgeInsets symmetricPaddingGeometry({
    required BuildContext context,
    double vertical = 0.0,
    double horizontal = 0.0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: Dimensions.setWidth(
        context: context,
        width: horizontal,
      ),
      vertical: Dimensions.setHeight(
        context: context,
        height: vertical,
      ),
    );
  }

  static EdgeInsets allPaddingGeometry({
    required BuildContext context,
    double value = 0.0,
  }) {
    return EdgeInsets.all(
      (Dimensions.getWidth(context: context) +
          Dimensions.setHeight(context: context)) / 2*value,
    );
  }
}
