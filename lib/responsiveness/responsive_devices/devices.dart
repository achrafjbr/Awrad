

import 'package:flutter/material.dart';

class Devices extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? web;

  const Devices({
    super.key,
    this.tablet,
    this.mobile,
    this.web,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1024) {
        return web!;
      }
      if (constraints.maxWidth >= 600) {
        return tablet!;
      } else {
        return mobile!;
      }
    });
  }
}
