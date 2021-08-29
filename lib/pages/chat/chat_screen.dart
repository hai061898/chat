import 'package:chat/widgets/listcard.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  FloatingActionButton(  
        onPressed: (){},
        child: Icon(Icons.chat),

      ),
      body: ListView( 
        children: [
          ListCard()
        ],
      ),
    );
  }
}
