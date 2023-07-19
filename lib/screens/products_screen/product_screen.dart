import 'package:flutter/material.dart';
import 'package:pedidos_express/styles/text.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MyText.p(context: context, text: "PRODUCT SCREEN")),
    );
  }
}
