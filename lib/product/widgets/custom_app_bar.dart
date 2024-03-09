import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool isLeading;
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.isLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: isLeading
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                //color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : const SizedBox(),
      title: Text(
        title,
        //  style: const TextStyle(color: Colors.black),
      ),
      actions: actions,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
