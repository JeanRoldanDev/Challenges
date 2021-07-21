import 'package:challenges/whatsapp/data.dart';
import 'package:challenges/whatsapp/helpers.dart';
import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late bool callStatus = false;
    return ListView.builder(
      itemCount: 9,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, index) {
        callStatus = !callStatus;
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Helpers.greyLigthColor,
            backgroundImage: AssetImage(User.listUser[index].img),
          ),
          title: Text(
            '${User.listUser[index].name} ${User.listUser[index].surname}',
            style: Helpers.txtDefault,
          ),
          subtitle: Row(
            children: [
              Icon(
                callStatus
                    ? Icons.call_made_rounded
                    : Icons.call_received_rounded,
                color: callStatus ? Helpers.greenColor : Colors.red,
                size: 18,
              ),
              Text(
                'Ayer 2:44 p.p',
                style: Helpers.txtDefault.copyWith(
                  color: Helpers.principalColor.withOpacity(0.5),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.call,
            color: Helpers.greenColor,
          ),
        );
      },
    );
  }
}
