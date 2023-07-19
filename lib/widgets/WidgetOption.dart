import 'package:flutter/material.dart';
import '../styles/color.dart';
import '../styles/text.dart';

Widget widgetOption({
  required BuildContext context,
  String title = "",
  String subtitle = "",
  Icon icon = const Icon(Icons.card_travel_sharp),
  callback}){
  return InkWell(
    splashColor: Theme.of(context).primaryColor,
    overlayColor: MaterialStateProperty.all(Theme.of(context).disabledColor),
    onTap: callback,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Card(
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: icon,
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.p(context: context, text: title, color: "white",fontWeight: true),
                            MyText.label(context: context, text: subtitle, color: "primary"),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ]),
            ],
          ),
        ),
      ),
    ),
  );
}