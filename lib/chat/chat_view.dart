import 'dart:developer';

import 'package:chat/chat/chat_viewmodel.dart';
import 'package:chat/layout/provider/my_provider.dart';
import 'package:chat/models/message.dart';
import 'package:chat/shared/base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/room.dart';
import 'message_widget.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = "Chat";

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseView<ChatScreen, ChatViewModel>
    implements ChatNavegator {
  var messageControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    viewModel.myUser = provider.myUser!;
    var room = ModalRoute.of(context)!.settings.arguments as Room;
    viewModel.room = room;
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Stack(children: [
          Image.asset("assets/images/background.png",
              width: double.infinity,
              fit: BoxFit.fill,
              height: double.infinity),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(room.title),
                centerTitle: true),
            body: Column(children: [

              Expanded(
                child: Container(

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5))],
                        ),

                  child: StreamBuilder<QuerySnapshot<Message>>(
                    stream: viewModel.getMessage(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Text("Some Thing Went Wrong");
                      }
                      var messages =
                          snapshot.data?.docs.map((e) => e.data()).toList();
                      return ListView.builder(
                          itemBuilder: (context, index) {
                            return MessageWidget(messages![index]);
                          },
                          itemCount: messages?.length ?? 0);
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: messageControler,
                    decoration: const InputDecoration(
                        hintText: "Type a Message",
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.blue))),
                  )),

              InkWell(
                onTap: () {
                  viewModel.sendMessage(messageControler.text);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: const [
                      Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.send, color: Colors.white),
                    ],
                  ),
                ),
              )
                ],
              ),  ]),
          )
        ]));
  }

  @override
  void uploadMessageToFirestore() {
    messageControler.clear();
    setState(() {});
  }

  @override
  ChatViewModel initviewModel() => ChatViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navegator = this;
  }
}
