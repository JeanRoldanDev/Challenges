import 'package:challenges/whatsapp/pages/calls_page.dart';
import 'package:challenges/whatsapp/pages/chats_page.dart';
import 'package:challenges/whatsapp/pages/groups_page.dart';
import 'package:challenges/whatsapp/pages/status_page.dart';
import 'package:challenges/whatsapp/widgets/appbarw.dart';
import 'package:challenges/whatsapp/widgets/historys.dart';
import 'package:challenges/whatsapp/widgets/tabsw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Whatsapp extends StatefulWidget {
  const Whatsapp({Key? key}) : super(key: key);

  @override
  _WhatsappState createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  ValueNotifier<int> pageIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
  }

  void changePage(int index) {
    if ((index + 1) == pageController.page ||
        (index - 1) == pageController.page) {
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      pageController.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarW('Whatsapp'),
      body: Column(
        children: [
          Historys(),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (indexPage) {
                pageIndex.value = indexPage;
              },
              itemBuilder: (_, int index) {
                switch (index) {
                  case 0:
                    return ChatsPage();
                  case 1:
                    return GroupsPage();
                  case 2:
                    return StatusPage();
                  case 3:
                    return CallsPage();
                  default:
                    return SizedBox.shrink();
                }
              },
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: pageIndex,
            builder: (_, value, __) {
              return Tabs(
                listBtnTabs: [
                  BtnTab(
                    text: 'Chats',
                    notications: 10,
                    status: (value == 0),
                    ontap: () => changePage(0),
                  ),
                  BtnTab(
                    text: 'Grupos',
                    notications: 5,
                    status: (value == 1),
                    ontap: () => changePage(1),
                  ),
                  BtnTab(
                    text: 'Estados',
                    status: (value == 2),
                    ontap: () => changePage(2),
                  ),
                  BtnTab(
                    text: 'Llamadas',
                    status: (value == 3),
                    ontap: () => changePage(3),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
