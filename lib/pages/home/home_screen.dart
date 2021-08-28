import 'package:chat/pages/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "Chat",
              ),
              Tab(
                text: "Group",
              ),
              Tab(
                text: "Call",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            Text("1"),
            ChatScreen(),
            Text("3"),
            Text("4"),
          ],
        ));
  }
}
