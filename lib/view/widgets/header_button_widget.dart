import 'package:flutter/material.dart';
import '../../constants/themes/app_themes.dart';
import '../../responsiveness/responsive_component/box.dart';
class HeaderButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final Color? color;

  const HeaderButtonWidget({
    super.key,
    this.color,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Box.setBox(
      context: context,
      width: 0.13,
      height: 0.06,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            border: Border.all(
              color: color??AppThemes.kGery,
              width: 0.5,
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: child,
        ),
      ),
    );
  }
}