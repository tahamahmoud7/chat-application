import 'package:chat/database_utils/Database_Utils.dart';
import 'package:chat/models/my_user.dart';
import 'package:chat/screens/login_screen/login_navegator.dart';
import 'package:chat/shared/base.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends BaseViewModel<LoginNavegator> {
  var auth = FirebaseAuth.instance;
  var message = "";

  void LoginWithFirebaseAuth(String email, String password) async {
    try {
      navegator!.ShowLoading();
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      message = "Successfully logged";
      MyUser? myUser =
          await DatabaseUtils.readUserFromFireStore(credential.user?.uid ?? "");
      if(MyUser!=null){
        navegator!.hideLoading();
    navegator!.GoToHome(myUser!);
    return;
      }
    } on FirebaseAuthException catch (e) {
      message = 'wrong email or password';
    } catch (e) {
      message = "Something went wrong $e";
    }
    if (message != "") {
      navegator!.ShowLoading();
      navegator!.ShowMessage(message);
    }
  }
}
