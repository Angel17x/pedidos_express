import 'package:flutter/material.dart';
import 'package:pedidos_express/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:pedidos_express/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = await ExpressTheme().getTheme;

  await dotenv.load(fileName: ".env.dev");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(ChangeNotifierProvider(
        create: (BuildContext context) => ExpressTheme(),
        child: MyApp(theme: themeProvider),
      ));
}

class MyApp extends StatelessWidget {
  final theme;
  const MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
      return MaterialApp.router(
        theme: theme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      );
    }
  }

