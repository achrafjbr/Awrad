import 'package:flutter/material.dart';

import '../../constants/themes/app_themes.dart';


class MobileDevice extends StatelessWidget {
  const MobileDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppThemes.kWhite,
      // ! Check here if the user already has an account or not.
    //  body:  User.userId!=null? const BridgeScreen():SingInScreen(),
    );
  }
}