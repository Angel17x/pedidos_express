import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pedidos_express/models/user/user_model.dart';
import 'package:pedidos_express/screens/register_screen/register_bloc.dart';
import 'package:pedidos_express/styles/text.dart';

import '../../styles/color.dart';
import '../../utils/routes_name.dart';
import '../../widgets/textButtons.dart';

class RegisterScreen extends StatefulWidget {
  final RegisterBloc bloc;
  const RegisterScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  Widget get _name => Column(
    children: [
      Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        shadowColor: Theme.of(context).primaryColorLight,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorWidth: 5,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.people_alt),
                  suffixIconColor: ColorUtil.gray,
                  hintText: "Nombre",
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget get _password => Column(
    children: [
      Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        shadowColor: Theme.of(context).primaryColorLight,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorWidth: 5,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.password),
                  suffixIconColor: ColorUtil.gray,
                  hintText: "Contraseña",
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget get _email => Column(
    children: [
      Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        shadowColor: Theme.of(context).primaryColorLight,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorWidth: 5,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email_outlined),
                  suffixIconColor: ColorUtil.gray,
                  hintText: "Correo electrónico",
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget get _address =>
        Material(
          borderRadius: BorderRadius.circular(25),
          elevation: 5,
          shadowColor: Theme.of(context).primaryColorLight,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  // onChanged: (text) => _bloc.updateUserName(text),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (value) => snapshot.error?.toString(),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  cursorWidth: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorUtil.white,
                    suffixIcon: Icon(Icons.account_tree),
                    suffixIconColor: ColorUtil.gray,
                    hintText: "Dirección",
                  ),
                ),
              ),
            ],
          ),
        );

  Widget get _button => Row(
    children: [
      Expanded(child:
      ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
        ),
        onPressed: () {
          context.pushNamed(RoutesNames.selectTypeUser.name, extra: UserModel.fromJson(data: {
            "name": "Angel Lugo",
            "address": "Los Teques",
            "email": "angel26078613@gmail.com",
            "password": "Aelohack23.",
          }));
        },
        child: const Text('Crear una cuenta'),
      ),)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorUtil.secondary_light),
          backgroundColor: ColorUtil.transparent,
          title: MyText.h6(context: context, text: "Crear cuenta", fontWeight: false, color: ""),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Column(children: [
                  _name,
                  SizedBox(height: 25),
                  _address,
                  SizedBox(height: 25),
                  _email,
                  SizedBox(height: 25),
                  _password,
                  SizedBox(height: 25),
                  _button
                ],),
                Column(children: [
                  SizedBox(height: 10),
                  TextButtonTitleRef(
                      title: '¿Ya eres usuario de la plataforma?',
                      text: 'Inicia sesión',
                      callback: () => context.goNamed(RoutesNames.register.name)
                  ),
                  SizedBox(height: 20),
                ],)
            ]),
          ),
        ),
      ));
  }
}
