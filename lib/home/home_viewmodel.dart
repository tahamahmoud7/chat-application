import 'package:chat/database_utils/Database_Utils.dart';
import 'package:chat/shared/base.dart';

import '../models/room.dart';

class HomeViewModel extends BaseViewModel{
  List<Room>rooms=[];
  void reedRooms(){
    DatabaseUtils.reedRoomsFromFirestore().then((value) {
      rooms=value;
    }).catchError((error){
      navegator!.ShowMessage(error.toString());
    });
  }
}