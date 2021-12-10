import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuLeft extends StatelessWidget {
  MenuLeft({
    Key? key,
    required this.itemsMenu,
    required this.width,
  }) : super(key: key);
  final List<BtnMenuLeft> itemsMenu;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.30),
            spreadRadius: 10,
            blurRadius: 20,
            offset: Offset(5, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(itemsMenu.length, (index) => itemsMenu[index])
              .toList()
        ],
      ),
    );
  }
}

class BtnMenuLeft extends StatelessWidget {
  BtnMenuLeft(
    this.assetNameIcon, {
    Key? key,
    this.status = false,
  }) : super(key: key);

  final bool status;
  final String assetNameIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 5,
            height: 20,
            color: status ? Colors.blue : Colors.grey.shade600,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  print('click');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    assetNameIcon,
                    alignment: Alignment.center,
                    color: status ? Colors.blue : Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
