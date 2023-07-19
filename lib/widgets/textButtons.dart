import 'package:flutter/material.dart';

import '../styles/color.dart';
import '../styles/text.dart';

class TextButtonRef extends StatelessWidget {
  final String message;
  final VoidCallback? callback;

  TextButtonRef({required this.message,  this.callback});

  @override
  Widget build(BuildContext context) {
   return Row(
      children: [
        Expanded(
          child: InkWell(
              onTap: callback,
              child: MyText.p(context: context, text: message, color: "primary")),
        ),
      ],
    );

  }
}

class TextButtonTitleRef extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback? callback;

  TextButtonTitleRef({required this.title, required this.text, this.callback});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: InkWell(
              onTap: callback,
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: title,
                          style: TextStyle(fontFamily: 'Poppins', color: ColorUtil.secondary, fontSize: 16)),
                      TextSpan(text: ' ${text}',
                          style: TextStyle(fontFamily: 'Poppins', color: Theme.of(context).primaryColor, fontSize: 16)),
                    ],
                  )
              ),
            ),
          ),
        ),
      ],
    );

  }
}
