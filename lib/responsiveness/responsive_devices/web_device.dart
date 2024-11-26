import 'package:flutter/material.dart';

class WebDevice extends StatelessWidget {
  const WebDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('WEB'),
            SizedBox(
              height: 50,
            ),
            //ElevatedButtonWidget(title: 'I want to be notified', onPress: () {print('Hello...!');},),
            SizedBox(
              height: 50,
            ),
            Text('WEB'),
          ],
        ),
      ),
    );
  }
}
