import 'package:abu_sandia/responsiveness/responsive_component/dimensions.dart';
import 'package:flutter/material.dart';

import '../../constants/images/image_handler.dart';

class AssetImageWidget extends StatelessWidget {
  // image Width.
  final double? imageWidth;

  // image Height.
  final double? imageHeight;

  /// image alignment takes [Alignment].
  final AlignmentGeometry alignment;

  /// image fit takes [BoxFit].
  final BoxFit? fit;

  /// image color takes [Colors] or [AppThemes.color] .
  final Color? color;

  /// image Path consume it from [ImageRoot] class it's a [static variable].
  final String imageRoot;

  /// image name consume it from [ImagePaths] class it's a [static variable].
  final String image;

  const AssetImageWidget({
    super.key,
    this.imageWidth,
    this.imageHeight,

    /// image name consume it from [ImagePaths] class it's a (static variable).
    required this.image,
    this.fit,
    this.alignment = Alignment.center,
    this.color,

    /// image Path consume it from [ImageRoot] class it's a (static variable).
    required this.imageRoot,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageHandler.getImagePath(
        imageRoot: imageRoot,
        image: image,
      ),
      width: Dimensions.setWidth(
        context: context,
        width: imageWidth ?? 0.01,
      ),
      height: Dimensions.setHeight(
        context: context,
        height: imageHeight ?? 0.01,
      ),
      fit: fit,
      color: color,
      alignment: alignment,
    );
  }
}
