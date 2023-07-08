import 'package:flutter/material.dart';

showLoading(BuildContext context, String message,) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  width: 6,
                ),
                Text(message)
              ]),
            ),
          ));
}

hideLoding(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(
    BuildContext context, String message, String posBtn, VoidCallback posAction,
    {String? nagBtn, VoidCallback? negAction}) {
  showDialog(
    context: context,
    builder: (context) {
      List<Widget>Action=[
        TextButton(onPressed: posAction, child: Text(posBtn))
      ];
      if(nagBtn!=null){
      Action.add( TextButton(onPressed: negAction, child: Text(nagBtn)));
      }
      return AlertDialog(
        title: Text(message),
    actions: Action,
      );
    },
  );
}
