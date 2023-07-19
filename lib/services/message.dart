import 'package:pedidos_express/utils/translate.dart';

class Message {
  int? status;
  String? error;
  List<String>? cause;

  Message.fromJson(Map<String, dynamic> json){
    status = json["status"] ?? 0;
    error = translate(name: json["error"] ?? "");
    cause = json["cause"]?.map((cause) => translate(name: cause)).toList();
  }
  Message.toJson(Map<String, dynamic> json){
    json["status"] = status;
    json["error"] = error;
    json["cause"] = cause;
  }
}