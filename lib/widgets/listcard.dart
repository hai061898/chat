import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(  
        radius: 25,
         backgroundImage: NetworkImage("https://scontent-xsp1-2.xx.fbcdn.net/v/t1.6435-9/p206x206/87857085_317664842522869_7035011982507900928_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=da31f3&_nc_ohc=eUA3NK8YArAAX-OBqOQ&_nc_ht=scontent-xsp1-2.xx&oh=4d098fe524de86633de7f51a0a42c382&oe=6152B2F1"),
      ),
      title: Text(  
        "Katana",
        style: TextStyle(  
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        
      ),
      subtitle: Row(
        children: [
          Icon(Icons.done_all),
          SizedBox(
            height: 3,
          ),
          Text("Hi Bro ", style: TextStyle(fontSize: 12),)
        ],
      ),
      trailing:  Text("10:00"),
    );
  }
}