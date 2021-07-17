import 'package:challenges/whatsapp/data.dart';
import 'package:challenges/whatsapp/helpers.dart';
import 'package:challenges/widgets/container_dashed/container_dashed.dart';
import 'package:flutter/material.dart';

class Historys extends StatelessWidget {
  const Historys({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: DataW.listHistory.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemBuilder: (__, index) {
          final history = DataW.listHistory[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ContainerDashed(
                        boxShape: BoxShape.circle,
                        strokeColor: Colors.blue,
                        strokeCap: StrokeCap.round,
                        strokeWidth: 2,
                        blankLength: 4,
                        numLines: history.postLength,
                        child: CircleAvatar(
                          backgroundColor: Helpers.greyLigth_color,
                          backgroundImage: AssetImage(history.user.img),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.only(bottom: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Helpers.greyLigth_color,
                            backgroundImage:
                                AssetImage(history.user.imgProfile),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  history.user.name,
                  style: Helpers.txtHistory_style,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
