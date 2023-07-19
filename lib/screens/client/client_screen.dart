import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pedidos_express/models/clients/clients_model.dart';
import 'package:pedidos_express/styles/color.dart';
import 'package:pedidos_express/styles/text.dart';

class ClientScreen extends StatefulWidget {
  final client;
  ClientScreen({Key? key, required this.client}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  Clients? _client;

  @override
  void initState() {
    super.initState();
      _client = widget.client;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // debugPrint("Will pop");
        context.pop();
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).secondaryHeaderColor,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2),
                              MyText.p(context: context, text: "${_client?.name}", color: "white"),
                              MyText.h4(context: context, text: _client?.type == "client" ? "Cliente" : "Usuario", color: "primary"),
                            ]),
                        InkWell(
                          child: CircleAvatar(
                            backgroundColor: Colors.black12,
                            backgroundImage: AssetImage('assets/images/man.png'),
                          ),
                          onTap: () async {

                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),),
    );
  }
}
