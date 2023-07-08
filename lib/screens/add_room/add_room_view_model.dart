import 'package:chat/screens/add_room/add_room_navegator.dart';
import 'package:chat/shared/base.dart';

import '../../database_utils/Database_Utils.dart';
import '../../models/room.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavegator> {
  void addRoomToDB(String title, String desc, String cateId) {
    Room room = Room(title: title, desc: desc, cateId: cateId);
    DatabaseUtils.addRoomToFirestore(room).then(
      (value) {
    navegator!.roomCreated();
      },
    ).catchError((error) {});
  }
}
