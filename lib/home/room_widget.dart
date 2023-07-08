import 'package:chat/chat/chat_view.dart';
import 'package:chat/models/room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomWidget extends StatelessWidget {
  Room room;

  RoomWidget(this.room);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ChatScreen.routeName,arguments: room);
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                    color: Colors.white)
              ]),
          child: Column(children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/${room.cateId}.png",
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(room.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,

                    fontSize: 15)),
          ]),
        ),
      ),
    );
  }
}
