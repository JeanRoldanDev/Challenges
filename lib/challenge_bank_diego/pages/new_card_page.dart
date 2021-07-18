import 'dart:ui';

import 'package:challenges/challenge_bank_diego/data.dart';
import 'package:challenges/challenge_bank_diego/helpers.dart';
import 'package:challenges/challenge_bank_diego/widgets/item_circle_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewCardPage extends StatelessWidget {
  NewCardPage({
    Key? key,
    required this.value,
    required this.maxheight,
    required this.maxWidth,
    this.isView = false,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.onTapBtnClose,
  }) : super(key: key);
  final double value;
  final double maxheight;
  final double maxWidth;
  final bool isView;

  final void Function(DragUpdateDetails details)? onVerticalDragUpdate;
  final void Function(DragEndDetails details)? onVerticalDragEnd;
  final VoidCallback? onTapBtnClose;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxheight,
      width: maxWidth,
      child: Padding(
        padding: EdgeInsets.all(lerpDouble(20, 0, value)!),
        child: Container(
          decoration: BoxDecoration(
            color: Helpers.purpleLigth_color,
            borderRadius: BorderRadius.circular(lerpDouble(30, 0, value)!),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Jean ',
                      style: Helpers.txtNameUser,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Roldan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: lerpDouble(75, 50, value),
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: CircleAvatar(
                            minRadius: 25,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              User.listUser[0].img,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Opacity(
                            opacity: lerpDouble(1, 0, value)!,
                            child: CircleAvatar(
                              minRadius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.credit_card,
                                color: Helpers.purpleColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Flexible(
                flex: 1,
                child: ListView.builder(
                  itemCount: User.listUser.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemExtent: (MediaQuery.of(context).size.width / 5) -
                      lerpDouble(0, 10, value)!,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  itemBuilder: (__, item) {
                    final widthChild = (MediaQuery.of(context).size.width / 5) -
                        lerpDouble(0, 10, value)!;
                    return FittedBox(
                      child: item == 0
                          ? ItemCircleUser(
                              name: 'Search',
                              width: widthChild,
                              child: Icon(CupertinoIcons.search),
                            )
                          : ItemCircleUser(
                              name: User.listUser[item].name,
                              width: widthChild,
                              backgroundImage:
                                  AssetImage(User.listUser[item].imgProfile),
                            ),
                    );
                  },
                ),
              ),
              if (value >= .3) const SizedBox(height: 20),

              Flexible(
                flex: 1,
                child: value <= 0.20
                    ? const SizedBox.shrink()
                    : Opacity(
                        opacity: value,
                        child: Container(
                          // height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue.shade300,
                          ),
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Helpers.purpleLigth_color,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Helpers.purpleLigth_color,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        'Holiday goal',
                                        style: Helpers.txtHoliday,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '\$100  \$5000',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Helpers.purpleColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: Helpers.fontPrincipal,
                                        fontSize: 25,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
              if (value >= .3) const SizedBox(height: 20),
              Flexible(
                flex: 3,
                child: value <= 0.20
                    ? const SizedBox.shrink()
                    : Opacity(
                        opacity: value,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (value >= .60) ...[
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.credit_card,
                                          size: 50,
                                          color: Helpers.purpleColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Pay for services',
                                          style: Helpers.txtList,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.credit_card,
                                          size: 50,
                                          color: Helpers.purpleColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'TaKE A LOAN ',
                                          style: Helpers.txtList,
                                        ),
                                        Spacer(),
                                        Text(
                                          '4%',
                                          style: Helpers.txtList,
                                        ),
                                        SizedBox(width: 20),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: GestureDetector(
                                    onVerticalDragUpdate: onVerticalDragUpdate,
                                    onVerticalDragEnd: onVerticalDragEnd,
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: InkWell(
                                        onTap: onTapBtnClose,
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Helpers.purpleLigth_color,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.more_horiz,
                                            color: Helpers.purpleColor,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
