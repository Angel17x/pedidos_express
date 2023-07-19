import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pedidos_express/models/user/user_model.dart';
import 'package:pedidos_express/styles/text.dart';

class SelectTypeUser extends StatefulWidget {
  UserModel user;
  SelectTypeUser({Key? key, required this.user}) : super(key: key);

  @override
  State<SelectTypeUser> createState() => _SelectTypeUserState();
}

class _SelectTypeUserState extends State<SelectTypeUser> {

  UserModel? user = null;

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  Widget _cardType({Icon? icon, String? name, String? description }){
    return Expanded(
      child: InkWell(
        onTap: (){},
        child: Card(
          elevation: 2,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? Icon(Icons.account_balance, size: 100,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        MyText.h5(
                            context: context,
                            text: name ?? "",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.h3(
                    context: context,
                    text: "¿Eres comercio o cliente?",
                    alignment: "start"
                ),
                MyText.p(
                    context: context,
                    text: "Seleccione una opción, ¿que tipo de usuario eres?",
                    alignment: "start"
                ),
              ],
            ),
            SizedBox(height: 10),
            _cardType(
                icon: Icon(Icons.business, size: 90, color: Colors.blueAccent),
                name: "",
                description: ""
            ),
            SizedBox(height: 10),
            _cardType(
                icon: Icon(Icons.people_alt, size: 90, color: Colors.amber),
                name: "",
                description: ""
            ),
            SizedBox(height: 10),
          ],
        )
      ),
    );
  }
}
