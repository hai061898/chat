import 'package:chat/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, this.chat}) : super(key: key);
  final ChatModel? chat;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
            radius: 23,
            child: SvgPicture.asset("assets/person.svg",color: Colors.white,height: 30,width: 30,),
            backgroundColor: Colors.grey,
          ),
         chat!.select ? Positioned(
            bottom: 4,
            right: 5,
            child: CircleAvatar(
              radius: 11,
              backgroundColor: Colors.teal,
              child: Icon(
              Icons.check,
              color: Colors.white,
              size: 10,
              )
            ),
          ) : Container(),
          ],
           
        ),
      ),
      title: Text(
        chat!.name!,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        chat!.status!,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
