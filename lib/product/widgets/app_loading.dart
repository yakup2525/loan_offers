import 'package:flutter/cupertino.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: CupertinoActivityIndicator(),
    );
  }
}
