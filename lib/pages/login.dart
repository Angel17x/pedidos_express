import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pedidos_express/styles/color.dart';
import 'package:pedidos_express/styles/text.dart';
import 'package:pedidos_express/utils/routes_name.dart';
import 'package:go_router/go_router.dart';

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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/icon/icon.png", width: 150, height: 150),
                      MyText.h4("PEDIDOS EXPRESS", "primary", false)
                    ],
                  ),
                  SizedBox(height: 40),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: (value) => Validator.email(value),
                                  cursorColor: Color.fromARGB(255, 255, 216, 42),
                                  cursorWidth: 5,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.email_outlined),
                                    suffixIconColor: ColorUtil.gray,
                                    enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                    width: 0.2, color: Color.fromARGB(255, 187, 187, 187))),
                                    focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                    width: 3, color: Color.fromARGB(255, 255, 216, 42))),
                                    border: OutlineInputBorder(),
                                    hintText: "Correo electrónico",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (value) => Validator.password(value),
                                    cursorColor: Color.fromARGB(255, 255, 216, 42),
                                    cursorWidth: 5,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.lock_outline),
                                      suffixIconColor: ColorUtil.gray,
                                      enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                      width: 0.4, color: Color.fromARGB(255, 187, 187, 187))),
                                      focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                      width: 3, color: Color.fromARGB(255, 255, 216, 42))),
                                      border: OutlineInputBorder(),
                                      hintText: 'Contraseña',
                                    )
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(child:
                                ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(0),
                                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                                    backgroundColor: MaterialStateProperty.all(ColorUtil.primary)
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.goNamed(RoutesNames.home.name);
                                    }
                                  },
                                  child: const Text('Iniciar sesión'),
                              ),)
                            ],
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}

class Validator{
  static password(value){
    if (value == null || value.isEmpty) {
      return 'la contraseña no puede estar vacía';
    }
    return null;
  }
  static email(value){
    if (value == null || value.isEmpty) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }
}
