import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/product/product.dart';

final class BlocInitialize extends StatelessWidget {
  const BlocInitialize({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: child,
    );
  }
}
