import 'package:chat/models/my_user.dart';
import 'package:chat/screens/create_account/create_account_navegator.dart';
import 'package:chat/screens/login_screen/login_view.dart';
import 'package:chat/shared/base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/home.dart';
import '../../layout/provider/my_provider.dart';
import 'create_account_view_model.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = "CreateAccount";

  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState
    extends BaseView<CreateAccountScreen, CerateAccountViewModel>
    implements CreateAccountNavegstor {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var FirstNameContrller = TextEditingController();
  var userNameContrller = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.navegator = this;
  }

  @override
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
                "Create Account",
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
                        controller: FirstNameContrller,
                        validator: (text) {
                          if (text!.trim() == '') {
                            return "Please Enter First Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Firs Name",
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
                        controller: userNameContrller,
                        validator: (text) {
                          if (text!.trim() == '') {
                            return "Please Enter User Name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "User Name",
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
                        validator: (text) {
                          if (text!.trim() == '') {
                            return "Please Enter Email";
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return "Please Enter valid email";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        controller: emailController,
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
                        textInputAction: TextInputAction.done,
                        toolbarOptions: const ToolbarOptions(
                            copy:
                                bool.hasEnvironment(AutofillHints.addressCity)),
                        validator: (text) {
                          if (text!.trim() == '') {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        obscureText: true,
                        obscuringCharacter: "*",
                        controller: passwordController,
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
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ValidateForm();
                          },
                          child: const Text("Create Account")),
                      TextButton(onPressed: (){
                        Navigator.pushReplacementNamed(context,LoginScreen.routeName);
                      }, child: Text("I Have An Account"))
                    ],
                  ),
                )),
          ),
        )
      ]),
    );
  }

  void ValidateForm() async {
    if (formKey.currentState!.validate()) {
      viewModel.CreateAccountWithFirebaseAuth(
          emailController.text, passwordController.text, FirstNameContrller.text,
      userNameContrller.text);
    }
  }

  @override
  CerateAccountViewModel initviewModel() {
    return CerateAccountViewModel();
  }

  @override
 void goToHome(MyUser myUser) {
    var provider = Provider.of<MyProvider>(context,listen: false);

    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
