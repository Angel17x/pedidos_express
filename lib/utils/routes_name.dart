import 'package:pedidos_express/utils/path.dart';

class RoutesNames{
  static Path root = Path(name: "root", path: "/");
  static Path home = Path(name: "home", path: "/home");
  static Path products = Path(name: "products", path: "products");
  static Path products_view = Path(name: "products_view", path: "products_view");
  static Path briefcase = Path(name: "briefcase", path: "/briefcase");
  static Path client = Path(name: "client", path: "client");
  static Path login = Path(name: "login", path: "login");
  static Path register = Path(name: "register", path: "register");
  static Path selectTypeUser = Path(name: "register_type", path: "register_type");
  static Path init = Path(name: "init", path: "/init");
  static Path logout = Path(name: "logout", path: "/logout");
}