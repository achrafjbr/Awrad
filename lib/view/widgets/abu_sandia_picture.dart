import 'package:flutter/material.dart';

import '../../constants/themes/app_themes.dart';
import '../../responsiveness/responsive_component/Dimensions.dart';

class AbuSandiaPicture extends StatelessWidget {
  final AlignmentGeometry alignment;

  const AbuSandiaPicture({
    super.key,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        // Show a border over image .
        margin: EdgeInsets.only(
          right: Dimensions.setWidth(context: context, width: 0.02),
        ),
        width: Dimensions.setRadius(context: context, radius: 0.60),
        height: Dimensions.setHeight(context: context, height: 0.15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppThemes.kPrimary,
            width: 3,
          ),
        ),
        child: CircleAvatar(
          maxRadius: 30,
          foregroundImage: AssetImage(
            'images/abu_sandia.png',
          ),
        ),
      ),
    );
  }
}
