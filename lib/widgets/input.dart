import 'package:flutter/material.dart';

import '../styles/color.dart';

class ElevatedTextFormField extends TextFormField {
  final double elevation;

  ElevatedTextFormField({
     this.elevation = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25),
      elevation: elevation ?? 5,
      shadowColor: Theme.of(context).primaryColorLight,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorWidth: 5,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.email_outlined),
                suffixIconColor: ColorUtil.gray,
                border: OutlineInputBorder(),
                hintText: "Correo electrónico",
              ),
            ),
          ),
        ],
      ),
    );
  }
}