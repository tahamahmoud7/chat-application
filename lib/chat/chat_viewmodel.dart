import 'package:chat/models/message.dart';
import 'package:chat/models/room.dart';
import 'package:chat/shared/base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../database_utils/Database_Utils.dart';
import '../models/my_user.dart';

class ChatViewModel extends BaseViewModel<ChatNavegator> {
  late Room room;
  late MyUser myUser;

  void sendMessage(String content) {
    Message message = Message(
        content: content,
        dateTime: DateTime.now().millisecondsSinceEpoch,
        roomId: room.id,
        senderId: myUser.id,
        senderName: myUser.userName);
    DatabaseUtils.addMessageToFire(message).then((value) {
      navegator!.uploadMessageToFirestore();
    });
  }
  Stream<QuerySnapshot<Message>> getMessage(){
  return  DatabaseUtils.readMessagesFromFirestore(room.id);
  }
}

abstract class ChatNavegator extends BaseNavegator {
  void uploadMessageToFirestore() {}
}
