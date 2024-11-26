import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// !Note Im gonna implement that class for all cubit.
class CubitInstance<T extends StateStreamableSource<Object?>> {

  T cubitInstance({required BuildContext context}) =>
      BlocProvider.of<T>(context);
}
