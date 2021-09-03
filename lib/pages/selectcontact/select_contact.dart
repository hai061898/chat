import 'package:chat/models/chat_model.dart';
import 'package:chat/pages/new%20group/group_screen.dart';
import 'package:chat/widgets/button_card.dart';
import 'package:chat/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> chat = [
    ChatModel(
        name: "user 1",
        isGroup: false,
        currentMessage: "new play",
        time: "4:00",
        icon: "person.png",
        status: "buil a"),
    ChatModel(
        name: "user 1",
        isGroup: false,
        currentMessage: "new play",
        time: "4:00",
        icon: "person.png",
        status: "A full star"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "Contact",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("New Group"),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text("Message"),
                  value: "message",
                ),
                PopupMenuItem(
                  child: Text("Setting"),
                  value: "setting",
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: chat.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GroundScreen()));
                  },
                  child: ButtonCard(icon: Icons.group, name: "New Group"));
            } else if (index == 1) {
              return ButtonCard(icon: Icons.person, name: "New ");
            }
            return ContactCard(
              chat: chat[index],
            );
          }),
    );
  }
}
