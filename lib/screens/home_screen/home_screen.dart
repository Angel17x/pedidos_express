import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pedidos_express/styles/text.dart';
import 'package:pedidos_express/utils/routes_name.dart';
import 'package:pedidos_express/widgets/default_appbar.dart';
import 'dart:core';

import '../../utils/Exit_app_util.dart';
import '../../widgets/WidgetOption.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  Widget get _header => Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
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
                  MyText.p(context: context, text: "Angel Lugo", color: "white"),
                  MyText.h4(context: context, text: "Comercio express", color: "primary"),
                  MyText.p(context: context, text: "Comercio", color: "primary"),
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
  );

  Widget get _balance => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.h4(context: context, text: "Balance", color: "white"),
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
                    MyText.label(context: context, text: "Total ventas",color: "white"),
                    MyText.h4(context: context, text: "Bs. 1,200.50", color: "primary", fontWeight: true),
                  ],
                ),
                MyText.p(context: context, text: "+%20", color: "primary", fontWeight: true),
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(30)),
    ),
  );

  Widget get _products => Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          widgetOption(
              context: context,
              title: "PRODUCTOS",
              subtitle: "Lista de productos",
              icon: Icon(Icons.shopping_cart),
              callback: () => context.pushNamed(RoutesNames.products.name)),
          widgetOption(
              context: context,
              title: "CLIENTES",
              subtitle: "Cartera de clientes",
              icon: Icon(Icons.people_rounded),
              callback: () => context.go(RoutesNames.briefcase.path)),

        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop:() async => await exitApp(context) ?? false,
        child: Scaffold(
            appBar: DefaultAppBar(),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  _header,
                  SizedBox(height: 10),
                  _balance,
                  SizedBox(height: 20),
                  _products
                ],
              ),
            )
        ),
    );
  }
}
