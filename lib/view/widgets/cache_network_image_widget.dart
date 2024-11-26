import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/themes/app_themes.dart';
import '../../responsiveness/responsive_component/Dimensions.dart';

/// This class is designed for image Message, however it can also deal with all image that coming from DB.
class CacheNetworkImageWidget extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final double? height;
  final double? width;

  const CacheNetworkImageWidget({
    super.key,
    required this.image,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // I'll search more about CacheNetworkImage to handle all his properties.
    return CachedNetworkImage(
      imageUrl: image,
      fit: fit,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: AppThemes.kPrimary,
        ),
      ),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
      height: Dimensions.setHeight(context: context, height: height ?? 0.30),
      width: Dimensions.setWidth(context: context, width: width ?? 0.70),
    );
  }
}
