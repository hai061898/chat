import 'package:chat/models/chat_model.dart';
import 'package:chat/widgets/listcard.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> chat = [
    ChatModel(
      name: "user 1",
      isGroup: false,
      currentMessage: "new play",
      time: "4:00",
      icon: "person.png"
      
    ),
     ChatModel(
      name: "user 1",
      isGroup: false,
      currentMessage: "new play",
      time: "4:00",
       icon: "person.png"
      
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chat.length,
        itemBuilder: (context,index) => ListCard(
          chat: chat[index]
        ),
      ),
    );
  }
}
