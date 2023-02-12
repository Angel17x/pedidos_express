import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pedidos_express/styles/color.dart';
import 'package:pedidos_express/styles/text.dart';
import 'dart:core';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Future.value(false),
      child: Scaffold(

          body: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorUtil.secondary,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 2),
                                MyText.p("Angel Lugo", "white", false),
                                MyText.h2("Inicio", "primary", false)
                              ]),
                          InkWell(
                            child: CircleAvatar(
                              backgroundColor: Colors.black12,
                              backgroundImage: AssetImage('assets/images/man.png'),
                            ),
                            onTap: () async {

                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText.h4("Balance", "white", false),
                              Icon(
                                Icons.wallet,
                                size: 50,
                                color: Colors.white,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.label("Total ventas","white", false),
                                  MyText.h4("Bs. 1,200.50", "primary", true),
                                ],
                              ),
                              MyText.p("+%20", "primary", true),
                            ],
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: ColorUtil.secondary,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [

                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
