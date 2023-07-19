import 'package:flutter/material.dart';
import '../styles/color.dart';

class MyText {
  const MyText();
  static Text h1({required BuildContext context, String text = "", String? color = "", bool? fontWeight = false, String alignment = ""}){
    return Text(text, textAlign: MyText.getAlign(alignment), style: TextStyle(fontSize: 45, color: MyText._getColor(context: context ,color: color),fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal));
  }
  static Text h2({required BuildContext context, String text = "", String? color = "", bool? fontWeight = false, String alignment = ""}){
    return Text(text, textAlign: MyText.getAlign(alignment), style: TextStyle(fontSize: 40, color: MyText._getColor(context: context ,color: color),fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal));
  }
  static Text h3({required BuildContext context, String text = "", String? color = "", bool? fontWeight = false, String alignment = ""}){
    return Text(text, textAlign: MyText.getAlign(alignment), style: TextStyle(fontSize: 35, color: MyText._getColor(context: context ,color: color),fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal));
  }
  static Text h4({required BuildContext context, String text = "", String? color = "", bool? fontWeight = false, String alignment = ""}){
    return Text(text, textAlign: MyText.getAlign(alignment), style: TextStyle(fontSize: 30, color: MyText._getColor(context: context ,color: color),fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal));
  }
  static Text h5({required BuildContext context, String text = "", String? color = "", bool? fontWeight = false, String alignment = ""}){
    return Text(text, textAlign: MyText.getAlign(alignment), style: TextStyle(fontSize: 25, color: MyText._getColor(context: context ,color: color),fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal));
  }
  static Text h6({required BuildContext context, String text = "", String? color = "", bool? fontWeight = false, String alignment = ""}){
    return Text(text, textAlign: MyText.getAlign(alignment), style: TextStyle(fontSize: 20, color: MyText._getColor(context: context ,color: color),fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal));
  }
  static Text p({required BuildContext context, String text = "", String? color = "", bool? fontWeight = false, String alignment = ""}){
    return Text(text, textAlign: MyText.getAlign(alignment),style: TextStyle(fontSize: 16,color: MyText._getColor(context: context,color: color),fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal));
  }
  static Text label({required BuildContext context, String text = "", String? color = "", bool? fontWeight = false}){
    return Text(text, style: TextStyle(fontSize: 14, color: MyText._getColor(context: context ,color: color!),fontWeight: fontWeight! ? FontWeight.bold : FontWeight.normal));
  }
  static RichText titleAndText({
    required BuildContext context,
    String title = "" ,
    String text = "",
    String color = "",
    double fontSize = 16,
    TextAlign align = TextAlign.left}){
    return RichText(
      textAlign: align,
      textDirection: TextDirection.rtl,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: title, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: MyText._getColor(context: context,color: color))),
          TextSpan(text: text, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal, color: MyText._getColor(context: context,color: color)))
        ],
      ),
    );
  }
  static TextAlign getAlign(String alingnment) {
    switch (alingnment) {
      case 'start':
        return TextAlign.start;
      case 'center':
        return TextAlign.center;
      case 'end':
        return TextAlign.end;
      default:
        return TextAlign.center;
    }
  }
  static Color _getColor({required BuildContext context, String? color = ""}){
    switch(color){
      case 'primary':
        return Theme.of(context).primaryColor;
      case 'secondary':
        return Theme.of(context).secondaryHeaderColor;
      case 'gray':
        return ColorUtil.gray;
      case 'white':
        return Colors.white;
      default:
        return Theme.of(context).secondaryHeaderColor;
    }
  }
}




