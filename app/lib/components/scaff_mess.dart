import 'package:flutter/material.dart';

class ScaffMess {
  static messanger(BuildContext context, String message, int d) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.grey.shade900,
      duration: Duration(seconds: d),
      content: Row(
        children: <Widget>[
          const CircularProgressIndicator(
            color: Colors.blue,
          ),
          Text(
            "  $message",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          )
        ],
      ),
    ));
  }
}