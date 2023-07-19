import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyUtils {
  static final String baseUrl = dotenv.env["BASE_URL_API"] ?? "";
  static final RegExp REX_EMAIL = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

}