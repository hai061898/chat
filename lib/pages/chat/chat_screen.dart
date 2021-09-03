import 'package:chat/models/chat_model.dart';
import 'package:chat/widgets/listcard.dart';
import 'package:flutter/material.dart';

import '../selectcontact/select_contact.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, this.chat,this.chatmodel}) : super(key: key);
   final List<ChatModel>? chatmodel;
  final ChatModel? chat;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodel!.length,
        itemBuilder: (context, index) => ListCard(
          chat: widget.chatmodel![index]
        ),
      ),
    );
  }
}
