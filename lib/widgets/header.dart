import 'package:challenges/helper.dart';
import 'package:flutter/material.dart';

class HeaderTop extends StatelessWidget {
  const HeaderTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.grey.shade300,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Helpers.bmwLogoImg,
            width: 50,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '10:28',
                  style: Helpers.txtHour,
                ),
                SizedBox(width: 3),
                Text(
                  'PM',
                  style: Helpers.txtHourType,
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(Helpers.profileImg),
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  'Jean',
                  style: Helpers.txtNameProfile,
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
