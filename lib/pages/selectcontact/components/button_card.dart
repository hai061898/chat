import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, this.name,this.icon}) : super(key: key);
  final String? name;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          radius: 23,
          child: Icon(icon),
        ),
        title: Text(
          name!,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        
      ),
    );
  }
}
