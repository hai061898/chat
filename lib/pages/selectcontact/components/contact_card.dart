import 'package:chat/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, this.chat}) : super(key: key);
  final ChatModel? chat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          child: SvgPicture.asset("assets/person.svg"),
          backgroundColor: Colors.grey,
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
      ),
    );
  }
}
