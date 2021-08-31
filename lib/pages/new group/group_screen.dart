import 'package:chat/models/chat_model.dart';
import 'package:chat/pages/new%20group/components/avatarcard.dart';
import 'package:chat/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class GroundScreen extends StatefulWidget {
  const GroundScreen({Key? key}) : super(key: key);

  @override
  _GroundScreenState createState() => _GroundScreenState();
}

class _GroundScreenState extends State<GroundScreen> {
  List<ChatModel> chat = [
    ChatModel(
      name: "user 1",
      isGroup: false,
      currentMessage: "new play",
      time: "4:00",
      icon: "person.png",
      status: "buil a",
    ),
    ChatModel(
      name: "user 1",
      isGroup: false,
      currentMessage: "new play",
      time: "4:00",
      icon: "person.png",
      status: "A full star",
    ),
  ];
  List<ChatModel> group = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "Add participant",
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
      body: Stack(
        children: [
          ListView.builder(
              itemCount: chat.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: group.length > 0 ? 90 :10 ,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (chat[index -1].select == false) {
                      setState(() {
                        chat[index-1].select = true;
                        group.add(chat[index-1]);
                      });
                    } else {
                      setState(() {
                        chat[index-1].select = false;
                        group.remove(chat[index-1]);
                      });
                    }
                  },
                  child: ContactCard(
                    chat: chat[index],
                  ),
                );
              }),
          group.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: chat.length,
                          itemBuilder: (context, index) {
                            if (chat[index].select == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    chat[index].select = false;
                                    group.remove(chat[index]);
                                  });
                                },
                                child: AvatarCard(
                                  chat: chat[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
