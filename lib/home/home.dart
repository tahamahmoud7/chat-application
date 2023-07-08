import 'package:chat/home/home_navegator.dart';
import 'package:chat/home/home_viewmodel.dart';
import 'package:chat/home/room_widget.dart';
import 'package:chat/screens/login_screen/login_view.dart';
import 'package:chat/shared/base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/add_room/add_room_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavegator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navegator = this;
    viewModel.reedRooms();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddRoomScreen.routeName);
                },
                child: const Icon(Icons.add, color: Colors.white),
              ),
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text("Chat App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      },
                      icon: const Icon(Icons.logout))
                ],
              ),
              body: Consumer<HomeViewModel>(
                builder: (_, homeViewModel, c) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) {
                      return RoomWidget(homeViewModel.rooms[index]);
                    },
                    itemCount: homeViewModel.rooms.length,
                  );
                },
              )),
        ],
      ),
    );
  }

  @override
  HomeViewModel initviewModel() {
    return HomeViewModel();
  }
}
