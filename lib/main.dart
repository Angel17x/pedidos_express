import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:pedidos_express/routes/routes.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          backgroundColor: Color.fromARGB(255, 255, 216, 42),
          splashIconSize: 400,
          duration: 1000,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/icon/icon.png", height: 180, width: 180),
              SizedBox(height: 10),
              Text("PEDIDO EXPRESS",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
            ],
          ),
          animationDuration: const Duration(seconds: 1),
          nextScreen: const Scaffold(
            body: Routes(),
          ),
        ));
  }
}
