import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseNavegator {
  void ShowLoading({String message});

  void ShowMessage(String message) {}

  void hideLoading();
}

class BaseViewModel<NAV extends BaseNavegator> extends ChangeNotifier {
  NAV? navegator = null;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavegator {
  late VM viewModel;

  VM initviewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = initviewModel();
  }

  @override
  void ShowLoading({String message = "Loading"}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Center(
                child: Row(
          children: [
            Text(message),
            const CircularProgressIndicator(),
          ],
        )));
      },
    );
  }

  @override
  void ShowMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }
}
