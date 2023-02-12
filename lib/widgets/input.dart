import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;
  final bool typePassword;
  const Input(
      {super.key,
      required this.placeholder,
      required this.controller,
      required this.typePassword});
  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.typePassword,
      controller: widget.controller,
      cursorColor: Color.fromARGB(255, 255, 216, 42),
      cursorWidth: 5,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 0.2, color: Color.fromARGB(255, 187, 187, 187))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: Color.fromARGB(255, 255, 216, 42))),
          border: OutlineInputBorder(),
          hintText: widget.placeholder),
    );
  }
}
