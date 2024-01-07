import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? leadingOnPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.leadingOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 12,
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 103, 139, 103), Color.fromARGB(255, 26, 85, 25)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_arrow_left,
          color: Color(0xffffffff),
        ),
        onPressed: leadingOnPressed ?? () {},
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}