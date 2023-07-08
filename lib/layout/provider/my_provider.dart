import 'package:chat/database_utils/Database_Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../models/my_user.dart';

class MyProvider extends ChangeNotifier {
  MyUser? myUser;
   User? firebase;

  MyProvider() {
    firebase = FirebaseAuth.instance.currentUser;
    if(firebase!=null){
      initMyUser();
    }
  }

  void initMyUser()async {
    myUser=(await DatabaseUtils.readUserFromFireStore( firebase?.uid??""));
  }
}
