import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pedidos_express/styles/color.dart';
import 'package:pedidos_express/styles/text.dart';
import 'package:pedidos_express/utils/routes_name.dart';

import '../../models/clients/clients_model.dart';

class BriefCaseScreen extends StatefulWidget {
  const BriefCaseScreen({Key? key}) : super(key: key);

  @override
  State<BriefCaseScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<BriefCaseScreen> {
  List<Clients> _clients = [
    Clients(name: "Angel",  type: "client"),
    Clients(name: "Marelbis", type: "client"),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() async {
        context.go(RoutesNames.home.path);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 4,
        title: Row(children: [
          IconButton(onPressed: () => context.go(RoutesNames.home.path),
              icon: Icon(Icons.arrow_back))
        ],),
        elevation: 0,
        backgroundColor: ColorUtil.secondary,
      ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemCount: _clients.length,
                    itemBuilder: (_, index) => InkWell(
                    splashColor: ColorUtil.primary,
                    overlayColor: MaterialStateProperty.all(ColorUtil.primary_light),
                    onTap: (){
                      context.pushNamed(RoutesNames.client.name, extra: _clients[index]);
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Card(
                                        elevation: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset('assets/images/man.png', width: 30,),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MyText.p(context: context, text: "${_clients[index].name ?? ""}", fontWeight: true),
                                    ],
                                  ),
                                ],
                              ),

                              Icon(Icons.arrow_forward_ios_rounded, color: ColorUtil.primary)
                              ]),
                          ],
                        ),
                      ),
                  ),
                    separatorBuilder: (_, index) => Divider(height: 0),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
