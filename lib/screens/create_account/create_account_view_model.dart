

import 'package:chat/database_utils/Database_Utils.dart';
import 'package:chat/models/my_user.dart';
import 'package:chat/shared/base.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../shared/compnents/firebase_error.dart';
import 'create_account_navegator.dart';

class CerateAccountViewModel extends BaseViewModel<CreateAccountNavegstor> {
  String message = "";

  void CreateAccountWithFirebaseAuth(String email, String password,
      String userName, String fistName) async {
    try {
      navegator!.ShowLoading();
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      message = "Account Created";
      MyUser myUser = MyUser(id: credential.user?.uid ?? "",
          email: email,
          fistName: fistName,
          userName: userName);
      DatabaseUtils.addUserToFireStore(myUser).then((value) {
        navegator!.hideLoading();
        navegator!.goToHome(myUser);
        return;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weakpassword) {
        message = "The password provided is too weak";
      } else if (e.code == FirebaseError.emailInUse) {
        message = "The account already exists for that email";
      }
    } catch (e) {
      message = "Something went wrong$e";
    }
    if (message != "") {
      navegator!.ShowLoading();
      navegator!.ShowMessage(message);
    }
  }
}
