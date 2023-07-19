import 'package:flutter/material.dart';

import '../styles/text.dart';

Future<bool> exitApp(BuildContext context) async {
  return await showDialog(context: context, builder: (BuildContext context)
  => AlertDialog(title:
  MyText.p(
      context: context,
      text: "¿Estas seguro que deseas salir de al app?"),
      actions: [
        MaterialButton(child: MyText.p(context: context, text: "SI"), onPressed: () => Navigator.of(context).pop(true)),
        MaterialButton(child: MyText.p(context: context, text: "NO") ,onPressed: () => Navigator.of(context).pop(false)),
    ],
  )) ?? false;
}