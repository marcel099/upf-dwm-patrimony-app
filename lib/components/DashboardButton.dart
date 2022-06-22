import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  String title;
  Function() onPressedFunc;

  DashboardButton({Key? key, required this.title, required this.onPressedFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ElevatedButton(
            onPressed: () => onPressedFunc(),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)),
            child: Text(title, style: const TextStyle(fontSize: 22))));
  }
}
