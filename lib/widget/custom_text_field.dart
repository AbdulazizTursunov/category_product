import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
        required this.hintText,
        required this.controller,
        required this.type,
        required this.action});

  final String hintText;
  final TextEditingController controller;
  final TextInputType type;
  final TextInputAction action;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(

          controller: controller,
          textInputAction: action,
          keyboardType: type,
          decoration: InputDecoration(hintText: hintText),
        )
      ],
    );
  }
}
