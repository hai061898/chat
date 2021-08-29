import 'package:chat/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualScreen extends StatefulWidget {
  const IndividualScreen({Key? key, this.chat}) : super(key: key);
  final ChatModel? chat;
  @override
  _IndividualScreenState createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                child: SvgPicture.asset(
                  widget.chat!.isGroup!
                      ? "assets/groups.svg"
                      : "assets/person.svg",
                  color: Colors.white,
                  height: 36,
                  width: 36,
                ),
                radius: 20,
                backgroundColor: Colors.green,
                // radius: 26,

                // backgroundImage: NetworkImage(
                //     "https://scontent-xsp1-2.xx.fbcdn.net/v/t1.6435-9/p206x206/87857085_317664842522869_7035011982507900928_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=da31f3&_nc_ohc=eUA3NK8YArAAX-OBqOQ&_nc_ht=scontent-xsp1-2.xx&oh=4d098fe524de86633de7f51a0a42c382&oe=6152B2F1"),
              ),
            ],
          ),
        ),
        title: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chat!.name!,
                style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text("Last seen today 12.00",
              style: TextStyle(  
                fontSize: 12,
              ),)
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call)),
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
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
    );
  }
}
