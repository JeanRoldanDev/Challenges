import 'dart:async';

import 'package:challenges/challenge_flutter_ecuador_one/helper.dart';
import 'package:flutter/material.dart';

extension MyHours on DateTime {
  String currentTime() {
    final hour = this.hour;
    final minute = this.minute;
    final seconds = this.second < 10 ? '0${this.second}' : '${this.second}';
    return '$hour:$minute:$seconds';
  }
}

class HeaderTop extends StatefulWidget {
  const HeaderTop({
    Key? key,
  }) : super(key: key);

  @override
  _HeaderTopState createState() => _HeaderTopState();
}

class _HeaderTopState extends State<HeaderTop> {
  final currentT = ValueNotifier<String>(DateTime.now().currentTime());
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      currentT.value = DateTime.now().currentTime();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey.shade300,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              Helpers.bmwLogoImg,
              width: 50,
            ),
          ),
          Align(
            child: Container(
              width: 120,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: ValueListenableBuilder<String>(
                valueListenable: currentT,
                builder: (_, value, __) => Text(value, style: Helpers.txtHour),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
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
            ),
          )
        ],
      ),
    );
  }
}
