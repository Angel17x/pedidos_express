import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pedidos_express/utils/routes_name.dart';
import '../../styles/color.dart';
import '../../styles/text.dart';
import 'init_bloc.dart';

class InitScreen extends StatefulWidget {
  final InitBloc bloc;
  const InitScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      home: AnimatedSplashScreen(
        backgroundColor: Theme.of(context).primaryColor,
        splashIconSize: 300,
        duration: 1500,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/order.json', width: 200, height: 200),
                MyText.h4(context: context, text: "PEDIDOS EXPRESS", color: "white")
            ]),
        animationDuration: const Duration(seconds: 1),
        nextScreen: BodyInit()
      ));

  }
}

class BodyInit extends StatefulWidget {
  @override
  State<BodyInit> createState() => _BodyInitState();
}

class _BodyInitState extends State<BodyInit> {
  Widget get _header => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset('assets/icon/icon.png', width: 200,),
      Row(
        children: [
          Expanded(child: MyText.h4(fontWeight: true, context: context, text: "Bienvenido a pedidos express")),
        ],
      ),
      SizedBox(height: 10),
      Row(
        children: [
          Expanded(child: MyText.p(fontWeight: false, context: context, text: "Inicia sesión o crea una cuenta")),
        ],
      )
    ],
  );

  Widget get _buttonRegister => Row(
    children: [
      Expanded(child:
      ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
        ),
        onPressed: () => context.goNamed(RoutesNames.register.name),
        child: const Text('CREAR CUENTA'),
      ))
    ],
  );

  Widget get _buttonLogin => Row(
    children: [
      Expanded(child:
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColorLight),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
        ),
        onPressed: () => context.goNamed(RoutesNames.login.name),
        child: const Text('INICIAR SESIÓN'),
      ))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Column(
                    children: [
                      _header,
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 20),
                      _buttonLogin,
                      SizedBox(height: 20),
                      _buttonRegister,
                    ],
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
