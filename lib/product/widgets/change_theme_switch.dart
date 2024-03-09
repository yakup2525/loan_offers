import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/product/product.dart';

class ChangeThemeSwitcher extends StatefulWidget {
  const ChangeThemeSwitcher({super.key});

  @override
  State<ChangeThemeSwitcher> createState() => _ChangeThemeSwitcherState();
}

class _ChangeThemeSwitcherState extends State<ChangeThemeSwitcher> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text('Dark'),
        CupertinoSwitch(
          value: switchValue,
          onChanged: (value) {
            if (value) {
              BlocProvider.of<ThemeBloc>(context).add(
                ThemeChanged(themeData: ThemeData.light()), // Temayı karanlık mod olarak değiştir
              );
            } else {
              BlocProvider.of<ThemeBloc>(context).add(
                ThemeChanged(themeData: ThemeData.dark()), // Temayı karanlık mod olarak değiştir
              );
            }
            setState(() {
              switchValue = value;
            });
          },
          trackColor: Color.fromARGB(97, 4, 16, 14),
          activeColor: const Color.fromARGB(98, 7, 230, 189),
        ),
        const Text('Light'),
      ],
    );
  }
}
