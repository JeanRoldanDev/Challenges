import 'dart:ui';

import 'package:challenges/3_whatsapp/helpers.dart';
import 'package:challenges/3_whatsapp/pages/calls_page.dart';
import 'package:challenges/3_whatsapp/pages/chats_page.dart';
import 'package:challenges/3_whatsapp/pages/groups_page.dart';
import 'package:challenges/3_whatsapp/pages/status_page.dart';
import 'package:challenges/3_whatsapp/widgets/appbarw.dart';
import 'package:challenges/3_whatsapp/widgets/button_circle.dart';
import 'package:challenges/3_whatsapp/widgets/historys.dart';
import 'package:challenges/3_whatsapp/widgets/tabsw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      // SystemChrome.setEnabledSystemUIOverlays([);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ));
    });

    return Scaffold(
      appBar: AppBarW('Whatsapp', btnBack: false),
      body: SafeArea(
        child: Column(
          children: [
            Historys(),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (indexPage) {
                  pageIndex.value = indexPage;
                },
                itemCount: 4,
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
      ),
      floatingActionButton: Align(
        heightFactor: 2.70,
        widthFactor: 0.5,
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Helpers.greenColor,
          ),
          margin: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                barrierColor: Colors.black.withOpacity(0.5),
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.white.withOpacity(0.8),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Container(
                                  width: 40,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    'Whatsapp Opciones',
                                    style: Helpers.txtDefault.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        ButtonCircle(
                                          onPressed: () {},
                                          icon: CupertinoIcons.chat_bubble_text,
                                          size: 70,
                                          iconSize: 32,
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          'Nuevo Chat',
                                          style: Helpers.txtDefault,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ButtonCircle(
                                          onPressed: () {},
                                          icon: CupertinoIcons.person_2,
                                          size: 70,
                                          iconSize: 32,
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          'Nuevo Grupo',
                                          style: Helpers.txtDefault,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ButtonCircle(
                                          onPressed: () {},
                                          icon: Icons.update_outlined,
                                          size: 70,
                                          iconSize: 32,
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          'Subir Historia',
                                          style: Helpers.txtDefault,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            color: Helpers.principalColor,
            splashRadius: 19,
            splashColor: Colors.grey,
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            icon: Icon(
              CupertinoIcons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
