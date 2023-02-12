import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pedidos_express/widgets/tabs.dart';

import '../styles/color.dart';
import '../utils/routes_name.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  List<ScaffoldWithNavBarTabItem> tabs = [
    ScaffoldWithNavBarTabItem(
        initialLocation: RoutesNames.home.path,
        icon: const Icon(Icons.home),
        label: "Inicio"),
    ScaffoldWithNavBarTabItem(
        initialLocation: RoutesNames.user.path,
        icon: const Icon(Icons.person_outline),
        label: "info"),
    ScaffoldWithNavBarTabItem(
        initialLocation: RoutesNames.logout.path,
        icon: const Icon(Icons.exit_to_app),
        label: "Cerrar sesión"),
  ];

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
    tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    // go to the initial location of the selected tab (by index)
    print(tabs[tabIndex].initialLocation);
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].initialLocation);
    } else {
      if (tabs[tabIndex].initialLocation == "/home") {
        context.go(tabs[tabIndex].initialLocation);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.child,
        bottomNavigationBar: CupertinoTabBar(
            activeColor: ColorUtil.secondary,
            backgroundColor: ColorUtil.primary,
            inactiveColor: ColorUtil.gray,
            currentIndex: _currentIndex,
            items: tabs,
            onTap: (index) => _onItemTapped(context, index)));
  }
}
