import 'package:abu_sandia/constants/images/image_roots.dart';
import 'package:abu_sandia/routes/app_routes.dart';
import 'package:abu_sandia/routes/navigation.dart';
import 'package:abu_sandia/view/widgets/asset_image_widget.dart';
import 'package:abu_sandia/view/widgets/offline_banner_widget.dart';
import 'package:flutter/material.dart';
import '../../constants/images/image_paths.dart';
import '../../constants/users/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.child});
  final Widget? child;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

      _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 5),
      );
      _animation =
          Tween<double>(begin: 1, end: 0).animate(_animationController);
      _animationController.forward();
      // Waiting for 5 sec after navigate to the specific screen.
      Future.delayed(
        Duration(seconds: 5),
        () {
          // Jump to description screen
          // if userID is equal to null
          // other wise jump to home screen.

          if (User.userID == null) {
            if (mounted) {
              Navigation.pushReplacementNamedNavigator(
                context: context,
                page: AppRoutes.descriptionScreen,
              );
            }
          } else {
            if (mounted) {
              Navigation.pushReplacementNamedNavigator(
                context: context,
                page: AppRoutes.homeScreen,
              );
            }
          }
        },
      );
    }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: AssetImageWidget(
            imageWidth: 0.40,
            imageHeight: 0.40,
            image: ImagePaths.logo,
            imageRoot: ImageRoots.logoRoot,
          ),
        ),
      ),
    );
  }
}
