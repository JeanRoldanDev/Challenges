import 'package:challenges/whatsapp/data.dart';
import 'package:challenges/whatsapp/helpers.dart';
import 'package:challenges/whatsapp/pages/chat_page.dart';
import 'package:challenges/whatsapp/widgets/button_circle.dart';
import 'package:challenges/widgets/navigation/right_to_left_route.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Mensajes',
                      style: Helpers.txtDefault.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Tienes 2 nuevos mensajes',
                      style: Helpers.txtDefault,
                    ),
                  ],
                ),
              ),
              ButtonCircle(
                icon: Icons.archive,
                backgroundColor: Colors.transparent,
                onPressed: () {},
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemExtent: 70,
            physics: const BouncingScrollPhysics(),
            itemCount: DataW.listChats.length,
            itemBuilder: (BuildContext context, int index) {
              final chat = DataW.listChats[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    RightToLeftRoute(
                      page: ChatPage(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 5,
                        color: chat.status
                            ? Helpers.greenColor
                            : Colors.transparent,
                        margin: const EdgeInsets.only(right: 3),
                      ),
                      Container(
                        width: 60,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              maxRadius: 25,
                              minRadius: 25,
                              backgroundImage:
                                  AssetImage(DataW.listChats[index].user.img),
                              backgroundColor: Helpers.greyLigthColor,
                            ),
                            Positioned(
                              right: 2,
                              top: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: DataW.listChats[index].user.status
                                      ? Helpers.greenColor
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${chat.user.name} ${chat.user.surname}',
                                    style: Helpers.txtDefault.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    chat.updateLast,
                                    style: Helpers.txtDefault,
                                  ),
                                ],
                              ),
                              Text(
                                chat.message,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: true,
                                style: Helpers.txtDefault,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
