import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pedidos_express/styles/text.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset("assets/icon/icon.png", width: 150, height: 150),
                  MyText.h4("PEDIDOS EXPRESS", "primary", false)
                ],
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (value) => Validator.validate(value),
                                cursorColor: Color.fromARGB(255, 255, 216, 42),
                                cursorWidth: 5,
                                decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                width: 0.2, color: Color.fromARGB(255, 187, 187, 187))),
                                focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                width: 3, color: Color.fromARGB(255, 255, 216, 42))),
                                border: OutlineInputBorder(),
                                hintText: "email"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (value) => Validator.validate(value),
                                  cursorColor: Color.fromARGB(255, 255, 216, 42),
                                  cursorWidth: 5,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                    width: 0.2, color: Color.fromARGB(255, 187, 187, 187))),
                                    focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                    width: 3, color: Color.fromARGB(255, 255, 216, 42))),
                                    border: OutlineInputBorder(),
                                    hintText: 'password')
                              ),
                            ),
                          ),
                        ],
                      )

                    ],
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}

class Validator{
  static validate(value){
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
