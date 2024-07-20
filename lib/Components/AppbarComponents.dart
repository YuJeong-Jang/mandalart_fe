import "package:flutter/material.dart";
import "package:make_me_better_mandalart_fe/Components/DefaultComponents.dart";

class AppbarComponents extends StatelessWidget implements PreferredSizeWidget {
  String title = '메인';

  AppbarComponents({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: InkWell(
        onTap: () {
          while (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        child: Text(title),
      ),
      backgroundColor: DefaultComponents.green(),
      actions: [
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
