import 'package:chat/models/category.dart';
import 'package:chat/screens/add_room/add_room_navegator.dart';
import 'package:chat/screens/add_room/add_room_view_model.dart';
import 'package:chat/shared/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = "AddRoom";

  const AddRoomScreen({super.key});

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseView<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavegator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var titleControler = TextEditingController();
  var descriptionControler = TextEditingController();
  var categries = RoomCategory.getCategories();
   late RoomCategory selectedCategory;

  @override
  void initState() {
    super.initState();
    viewModel.navegator = this;
    selectedCategory = categries[0];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Stack(children: [
          Image.asset("assets/images/background.png",
              width: double.infinity,
              fit: BoxFit.fill,
              height: double.infinity),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text("Add Room"),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Card(
                elevation: 20,
                margin: const EdgeInsets.all(30),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 20),
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              textAlign: TextAlign.center,
                              "Create New Room",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Image.asset("assets/images/main.gpg.png"),
                            TextFormField(
                              controller: titleControler,
                              keyboardType: TextInputType.emailAddress,
                              validator: (text) {
                                if (text!.trim() == '') {
                                  return "Please enter room title";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Title",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          const BorderSide(color: Colors.blue)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                          color: Colors.blue))),
                            ),
                            DropdownButton<RoomCategory>(
                              value: selectedCategory,
                              items: categries
                                  .map((cat) => DropdownMenuItem<RoomCategory>(
                                      value: cat,
                                      child: Row(
                                        children: [
                                          Image.asset(cat.image),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(cat.name),
                                        ],
                                      )))
                                  .toList(),
                              onChanged: (category) {
                                if (category == null) {
                                  return;
                                } else {
                                  selectedCategory = category;
                                }
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: descriptionControler,
                              validator: (text) {
                                if (text!.trim() == '') {
                                  return "Please Enter room description";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Description",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          const BorderSide(color: Colors.blue)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(
                                          color: Colors.blue))),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  validateForm();
                                },
                                child: const Text("Create Room")),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]));
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      //create room
      viewModel.addRoomToDB(
          titleControler.text,
          descriptionControler.text,
          selectedCategory.id);
    }
  }

  @override
  void roomCreated() {
    Navigator.pop(context);
  }

  @override
  AddRoomViewModel initviewModel() {
    return AddRoomViewModel();
  }
}
