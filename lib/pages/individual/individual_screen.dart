import 'package:chat/models/chat_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualScreen extends StatefulWidget {
  const IndividualScreen({Key? key, this.chat}) : super(key: key);
  final ChatModel? chat;
  @override
  _IndividualScreenState createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  IO.Socket? socket;
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void connect() {
    socket = IO.io("http://192.168.56.1:5000", <String, dynamic>{
      "transport": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.emit("/test", "Hello");
    socket!.onconnect();
    print(socket!.connected);
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
                style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
              ),
              Text(
                "Last seen today 12.00",
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55),
                          ),
                          child: TextFormField(
                            controller: controller,
                            focusNode: focusNode,
                            maxLines: 5,
                            minLines: 1,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Chat ....",
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      show = !show;
                                    });
                                  },
                                  icon: Icon(Icons.emoji_emotions),
                                ),
                                contentPadding: EdgeInsets.all(5),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.attach_file),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.camera_alt),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 8, right: 2, left: 2),
                        child: CircleAvatar(
                          radius: 25,
                          child: IconButton(
                            icon: Icon(Icons.mic),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  show ? emojipicker() : Container(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emojipicker() {
    return EmojiPicker(
        config: Config(
            columns: 7,
            emojiSizeMax: 32.0,
            verticalSpacing: 0,
            horizontalSpacing: 0,
            initCategory: Category.RECENT,
            bgColor: Color(0xFFF2F2F2),
            indicatorColor: Colors.blue,
            iconColor: Colors.grey,
            iconColorSelected: Colors.blue,
            progressIndicatorColor: Colors.blue,
            showRecentsTab: true,
            recentsLimit: 28,
            noRecentsText: "No Recents",
            noRecentsStyle:
                const TextStyle(fontSize: 20, color: Colors.black26),
            categoryIcons: const CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL),
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState(() {
            controller.text = controller.text + emoji.toString();
          });
        });
  }
}
