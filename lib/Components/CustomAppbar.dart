import "package:flutter/material.dart";
import "package:make_me_better_mandalart_fe/Components/DefaultComponents.dart";
import "package:make_me_better_mandalart_fe/States/BoardState.dart";
import "package:make_me_better_mandalart_fe/States/UserState.dart";
import "package:make_me_better_mandalart_fe/View/BoardRegister.dart";
import "package:provider/provider.dart";

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? leading;
  final bool? preventOnTap;

  CustomAppbar(
      {super.key, required this.title, this.leading, this.preventOnTap});

  @override
  Widget build(BuildContext context) {
    var userState = Provider.of<UserState>(context, listen: false);
    bool registBoard = userState.boardList.length > 0;
    return new AppBar(
      title: InkWell(
        onTap: () {
          if (preventOnTap!) {
            return;
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BoardRegister(
                          modify: registBoard,
                        )));
          }
          // }
          // else {
          //   while (Navigator.canPop(context)) {
          //     Navigator.pop(context);
          //   }
          // }
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
