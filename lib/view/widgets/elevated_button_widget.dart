import 'package:flutter/material.dart';

import '../../constants/themes/app_themes.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  //final String title;
  final Widget? child;
  final Color color;

  const ElevatedButtonWidget({
    super.key,
    this.onPressed,
    this.color = AppThemes.kPrimary,
    //required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          side: BorderSide.none,
          padding: const EdgeInsets.all(8.0),

          /// I'll change that using MediaQuery.
          //maximumSize: Size(Dimensions.setWidth(context: context, width: 0.70,),Dimensions.setHeight(context: context, height: 0.10,)),

          /// I'll change that using MediaQuery.
          // minimumSize: const Size(1, 3),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
