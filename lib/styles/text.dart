import 'package:flutter/material.dart';
import 'package:pedidos_express/styles/color.dart';

class MyText {
  static Text h1(String text, String color, bool fontWeight){
    return Text(text, style: TextStyle(fontSize: 45, color: MyText.getColor(color),fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal));
  }
  static Text h2(String text, String color, bool fontWeight){
    return Text(text, style: TextStyle(fontSize: 40, color: MyText.getColor(color),fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal));
  }
  static Text h3(String text, String color, bool fontWeight){
    return Text(text, style: TextStyle(fontSize: 35, color: MyText.getColor(color),fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal));
  }
  static Text h4(String text, String color, bool fontWeight){
    return Text(text, style: TextStyle(fontSize: 30, color: MyText.getColor(color),fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal));
  }
  static Text h5(String text, String color, bool fontWeight){
    return Text(text, style: TextStyle(fontSize: 25, color: MyText.getColor(color),fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal));
  }
  static Text p(String text, String color, bool fontWeight){
    return Text(text, style: TextStyle(fontSize: 16, color: MyText.getColor(color),fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal));
  }
  static Text label(String text, String color, bool fontWeight){
    return Text(text, style: TextStyle(fontSize: 14, color: MyText.getColor(color),fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal));
  }

  static Color getColor(String color){
    switch(color){
      case 'primary':
        return ColorUtil.primary;
      case 'secondary':
        return ColorUtil.secondary;
      case 'gray':
        return ColorUtil.gray;
      case 'white':
        return Colors.white;
      default:
        return Colors.black45;
    }
  }
}

