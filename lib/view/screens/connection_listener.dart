import 'package:abu_sandia/controller/cubits/internet_cubit/connection_cubit.dart';
import 'package:abu_sandia/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionListener extends StatelessWidget {
  final Widget child;

  const ConnectionListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionCubit, ConnectionStatus>(
      listener: (context, state) {
        if (state == ConnectionStatus.disconnected) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text("No Internet Connection"),
              content: Text("Please check your internet connection."),
              actions: [],
            ),
          );
        } else {
          // Close the dialog if connection returns
          Navigation.popNavigator(context: context);
        }
      },
      child: child,
    );
  }
}
