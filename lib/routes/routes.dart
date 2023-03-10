import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pedidos_express/pages/home.dart';
import 'package:pedidos_express/pages/logout.dart';
import 'package:pedidos_express/pages/user.dart';
import 'package:pedidos_express/utils/routes_name.dart';
import '../pages/login.dart';
import 'package:go_router/go_router.dart';

import '../widgets/nav.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class Routes extends StatelessWidget {
  const Routes({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: RoutesNames.root.path,
  navigatorKey: _rootNavigatorKey,
  routes:[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesNames.login.path,
      name: RoutesNames.login.name,
      builder: (BuildContext context, GoRouterState state) {
        print(state.location);
        return const Login();
      }
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesNames.root.path,
      name: RoutesNames.root.name,
      redirect: (BuildContext context, GoRouterState state) {
        print(state.location);
        return RoutesNames.home.path;
      },
    ),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          print(state.location);
          return Nav(child: child);
        },
        routes:[
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: RoutesNames.home.path,
            name: RoutesNames.home.name,
            builder: (BuildContext context, GoRouterState state) {
              print(state.location);
              return Home();
            },
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: RoutesNames.user.path,
            name: RoutesNames.user.name,
            builder: (BuildContext context, GoRouterState state) {
              print(state.location);
              return UserScreen();
            },
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: RoutesNames.logout.path,
            name: RoutesNames.logout.name,
            builder: (BuildContext context, GoRouterState state) {
              print(state.location);
              return LogoutScreen();
            },
          ),
        ]
    )
  ],
);
