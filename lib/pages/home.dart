import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (updateDetails) {},
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 216, 42),
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2),
                        Text("Joe Larry", style: TextStyle(fontSize: 20)),
                        Text("Inicio",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ]),
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Balance",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30)),
                              Icon(
                                Icons.wallet,
                                size: 50,
                                color: Colors.white,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total ventas",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Text("Bs. 1,200.50",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30)),
                                ],
                              ),
                              Text("+%20",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 126, 85, 251),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
