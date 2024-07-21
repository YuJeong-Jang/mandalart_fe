import "package:flutter/material.dart";
import "package:make_me_better_mandalart_fe/Components/DefaultComponents.dart";

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? leading;

  CustomAppbar({super.key, required this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: InkWell(
        onTap: () {
          while (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: DefaultComponents.achive75(),
      centerTitle: true,
      elevation: 0,
      leading: leading!
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
