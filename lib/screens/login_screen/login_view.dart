import 'package:chat/models/my_user.dart';

import 'package:chat/screens/login_screen/login_navegator.dart';
import 'package:chat/shared/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/home.dart';
import '../../layout/provider/my_provider.dart';
import '../create_account/create_account.dart';
import 'login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
var emailController = TextEditingController();

var passwordController = TextEditingController();

class _LoginScreenState extends BaseView<LoginScreen, LoginViewModel>
    implements LoginNavegator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navegator = this;
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(children: [
        Image.asset("assets/images/background.png",
            width: double.infinity, fit: BoxFit.fill, height: double.infinity),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                "Login",
              ),
              centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (text) {
                          if (text!.trim() == '') {
                            return "Please Enter Email";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue))),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: passwordController,
                        validator: (text) {
                          if (text!.trim() == '') {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    const BorderSide(color: Colors.blue))),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ValidateForm();
                          },
                          child: const Text("Create Account")),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, CreateAccountScreen.routeName);
                          },
                          child: const Text("Don't Have An Account?"))
                    ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void ValidateForm() {
    viewModel.LoginWithFirebaseAuth(
        emailController.text, passwordController.text);
  }

  @override
  LoginViewModel initviewModel() {
    return LoginViewModel();
  }

  @override
  void GoToHome(MyUser myUser) {
    var provider = Provider.of<MyProvider>(context, listen: false);

    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
