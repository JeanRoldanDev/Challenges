import 'package:challenges/whatsapp/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarW extends StatelessWidget implements PreferredSizeWidget {
  const AppBarW(this.title, {Key? key, this.btnBack})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  final bool? btnBack;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Whatsapp',
        style: TextStyle(
          color: Helpers.green_color,
          fontFamily: 'Konnect',
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        _BtnIconButton(
          onPressed: () {},
          icon: CupertinoIcons.moon_fill,
        ),
        _BtnIconButton(
          onPressed: () {},
          icon: CupertinoIcons.search,
        ),
        _BtnIconButton(
          onPressed: () {},
          icon: Icons.more_horiz,
        ),
      ],
    );
  }
}

class _BtnIconButton extends StatelessWidget {
  const _BtnIconButton({
    Key? key,
    this.onPressed,
    this.icon,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Helpers.greyLigth_color,
      ),
      margin: const EdgeInsets.only(right: 10),
      child: IconButton(
        onPressed: onPressed,
        color: Helpers.principal_color,
        splashRadius: 19,
        splashColor: Colors.grey,
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        icon: Icon(icon),
      ),
    );
  }
}
