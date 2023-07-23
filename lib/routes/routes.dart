import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pedidos_express/models/clients/clients_model.dart';
import 'package:pedidos_express/models/user/user_model.dart';
import 'package:pedidos_express/screens/init/init_bloc.dart';
import 'package:pedidos_express/screens/login_screen/login_screen_bloc.dart';
import 'package:pedidos_express/screens/products_screen/product_screen.dart';
import 'package:pedidos_express/screens/register_screen/register_bloc.dart';
import 'package:pedidos_express/services/cache_services.dart';
import 'package:pedidos_express/utils/routes_name.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen/home_screen_bloc.dart';
import '../screens/screens.dart';
import '../widgets/bottom.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _cache = CacheServices();

final GoRouter router = GoRouter(
  initialLocation: RoutesNames.root.path,
  navigatorKey: _rootNavigatorKey,
  routes:[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesNames.root.path,
      name: RoutesNames.root.name,
      redirect: (BuildContext context, GoRouterState state) {
        print(state.location);
        return RoutesNames.init.path;
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesNames.init.path,
      name: RoutesNames.init.name,
      builder: (BuildContext context, GoRouterState state) {
        print(state.location);
        return InitScreen(bloc: InitBloc());
      },
      routes: [
        GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: RoutesNames.login.path,
            name: RoutesNames.login.name,
            builder: (BuildContext context, GoRouterState state) {
              print(state.location);
              return LoginScreen(bloc: LoginScreenBloc());
            }
        ),
        GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: RoutesNames.register.path,
            name: RoutesNames.register.name,
            builder: (BuildContext context, GoRouterState state) {
              print(state.location);
              return RegisterScreen(bloc: RegisterBloc());
            },
          routes: [
            GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: RoutesNames.selectTypeUser.path,
                name: RoutesNames.selectTypeUser.name,
                builder: (BuildContext context, GoRouterState state) {
                  print(state.location);
                  var user = state.extra as UserModel;
                  Logger().i(user.toJson());
                  return SelectTypeUser(user: user);
                }
            ),
          ]
        ),

      ]
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
              return HomeScreen(bloc: HomeScreenBloc());
            },
            routes: [
              GoRoute(
                parentNavigatorKey: _shellNavigatorKey,
                path: RoutesNames.products.path,
                name: RoutesNames.products.name,
                builder: (BuildContext context, GoRouterState state) {
                  print(state.location);
                  return ProductScreen();
                },
                routes: [
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    path: RoutesNames.products_view.path,
                    name: RoutesNames.products_view.name,
                    builder: (BuildContext context, GoRouterState state) {
                      print(state.location);
                      return ProductScreen();
                    },
                  ),
                ]
              ),
            ]
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: RoutesNames.briefcase.path,
            name: RoutesNames.briefcase.name,
            builder: (BuildContext context, GoRouterState state) {
              print(state.location);
              return BriefCaseScreen();
            },
            routes: [
              GoRoute(
                  path: RoutesNames.client.path,
                  name: RoutesNames.client.name,
                  builder: (BuildContext context, GoRouterState state){
                    print(state.location);
                    var client = state.extra;
                    return ClientScreen(client: client);
                  })
            ]
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: RoutesNames.logout.path,
            name: RoutesNames.logout.name,
            builder: (BuildContext context, GoRouterState state) {
              print(state.location);
              return LogoutScreen();
            },
            redirect: (BuildContext context, GoRouterState state) async {
              print(state.location);
              bool isDelete = await _cache.deleteCredentials();
              if(isDelete){
                return RoutesNames.init.path;
              }else{
                return RoutesNames.logout.path;
              }
            },
          ),
        ]
    )
  ],
);
