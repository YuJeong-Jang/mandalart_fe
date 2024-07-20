import "package:flutter/material.dart";

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
      backgroundColor: Colors.green,
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back),
      //   onPressed: () {
      //     Navigator.of(context).pop();
      //   },
      // ),
      actions: [
        // IconButton(
        //   icon: Icon(Icons.home),
        //   onPressed: () {
        //     while (Navigator.canPop(context)) {
        //       Navigator.pop(context);
        //     }
        //   },
        // )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
