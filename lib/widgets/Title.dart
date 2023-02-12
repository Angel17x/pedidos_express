import 'package:flutter/cupertino.dart';

class Title extends StatelessWidget {
  final String text;
  final String type;
  const Title({super.key, required this.text, required this.type});
  @override
  Widget build(BuildContext context) {
    return listType(type);
  }

  listType(String type) {
    switch (type) {
      case "h1":
        Widget h1 = Text("");
        return h1;
      case "h2":
        Widget h2 = Text("");
        return h2;
      case "h3":
        Widget h3 = Text("");
        return h3;
      case "h4":
        Widget h4 = Text("");
        return h4;
      default:
    }
  }
}
