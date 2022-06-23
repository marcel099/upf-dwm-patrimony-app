import 'package:flutter/material.dart';

class InputFormApp extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  double labelTextSize;
  bool showRequiredMark;
  String hintText;
  bool autofocus;
  TextInputType keyboardType;
  Function(String?) validator;
  Function(String?) onSaved;

  InputFormApp({
    Key? key,
    required this.controller,
    required this.labelText,
    this.labelTextSize = 16,
    this.showRequiredMark = true,
    required this.hintText,
    this.autofocus = false,
    required this.validator,
    required this.onSaved,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$labelText ${showRequiredMark ? '*' : ''}",
            style: TextStyle(fontSize: labelTextSize)),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          autofocus: autofocus,
          decoration: InputDecoration(
            hintText: hintText,
            labelStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo,
                width: 3.0,
              ),
            ),
          ),
          autocorrect: false,
          style: const TextStyle(fontSize: 20),
          validator: (value) => validator(value),
          onSaved: (value) => onSaved(value),
        )
      ],
    );
  }
}
