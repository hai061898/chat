import 'package:chat/models/chat_model.dart';
import 'package:chat/pages/individual/individual_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key, this.chat, this.chatmodel}) : super(key: key);
  final ChatModel? chat;
  final ChatModel? chatmodel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualScreen(
                      chat: chat,
                      sourchat: chatmodel,
                    )));
      },
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            radius: 25,
            // backgroundImage: NetworkImage(
            //     "https://scontent-xsp1-2.xx.fbcdn.net/v/t1.6435-9/p206x206/87857085_317664842522869_7035011982507900928_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=da31f3&_nc_ohc=eUA3NK8YArAAX-OBqOQ&_nc_ht=scontent-xsp1-2.xx&oh=4d098fe524de86633de7f51a0a42c382&oe=6152B2F1"),
            child: SvgPicture.asset(
              chat!.isGroup! ? "assets/groups.svg" : "assets/person.svg",
              color: Colors.white,
              height: 36,
              width: 36,
            ),
          ),
          title: Text(
            chat!.name!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(Icons.done_all),
              SizedBox(
                height: 3,
              ),
              Text(
                chat!.currentMessage!,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          trailing: Text(chat!.time!),
        ),
        Divider(
          thickness: 1,
        ),
      ]),
    );
  }
}
