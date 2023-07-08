import 'package:chat/layout/provider/my_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/message.dart';

class MessageWidget extends StatelessWidget {
  Message message;

  MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return provider.myUser!.id== message.senderId
        ? SenderMessage(message)
        : RecivedMessage(message);
  }
}

class SenderMessage extends StatelessWidget {
  Message message;

  SenderMessage(this.message);

  @override
  Widget build(BuildContext context) {
    int ts = message.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);
    var date = DateFormat('mm/dd/yyyy,hh:mm a').format(dt);
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(12),
              )),
          child: Text(
            message.content,
            style: const TextStyle(color: Colors.white),
          )),
      Text(date.substring(12), style: const TextStyle(color: Colors.grey)),
    ]);
  }
}

class RecivedMessage extends StatelessWidget {
  Message message;

  RecivedMessage(this.message);

  @override
  Widget build(BuildContext context) {
    int ts = message.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);
    var date = DateFormat('mm/dd/yyyy,hh:mm a').format(dt);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              )),
          child: Text(message.content)),
      Text(date.substring(12),style: const TextStyle(color: Colors.grey)),
    ]);
  }
}
