import 'package:challenges/challenge_bank_diego/helpers.dart';
import 'package:flutter/material.dart';

class ItemCircleUser extends StatelessWidget {
  const ItemCircleUser({
    Key? key,
    required this.name,
    required this.width,
    this.backgroundImage,
    this.child,
  }) : super(key: key);
  final String name;
  final ImageProvider<Object>? backgroundImage;
  final Widget? child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            child: CircleAvatar(
              radius: width / 2,
              backgroundColor: Colors.white,
              backgroundImage: backgroundImage,
              child: backgroundImage == null ? child : null,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: width,
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Helpers.txtName,
            ),
          )
        ],
      ),
    );
  }
}
