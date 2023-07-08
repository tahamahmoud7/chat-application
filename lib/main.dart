import 'package:chat/chat/chat_view.dart';
import 'package:chat/home/home.dart';
import 'package:chat/layout/provider/my_provider.dart';
import 'package:chat/screens/add_room/add_room_screen.dart';
import 'package:chat/screens/create_account/create_account.dart';
import 'package:chat/screens/login_screen/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      initialRoute: provider.firebase != null
          ? HomeScreen.routeName
          : LoginScreen.routeName,
      routes: {
        CreateAccountScreen.routeName: (context) =>  const CreateAccountScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        ChatScreen.routeName: (context) => const ChatScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AddRoomScreen.routeName: (context) =>  const AddRoomScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
