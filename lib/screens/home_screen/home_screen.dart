import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pedidos_express/screens/home_screen/home_screen_bloc.dart';
import 'package:pedidos_express/styles/text.dart';
import 'package:pedidos_express/utils/routes_name.dart';
import 'package:pedidos_express/widgets/default_appbar.dart';
import '../../services/models/ecommerce_model.dart';
import '../../utils/Exit_app_util.dart';
import '../../widgets/WidgetOption.dart';

class HomeScreen extends StatefulWidget {
  final HomeScreenBloc bloc;
  const HomeScreen({super.key, required this.bloc});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  HomeScreenBloc get _bloc  => widget.bloc;

  @override
  void initState() {
    _bloc.getEcommerce();
    super.initState();
  }

  Widget _header({EcommerceModel? ecommerce}) => Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
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
                  MyText.p(context: context, text: ecommerce?.user_id?[0]?.name ?? "", color: "white"),
                  MyText.h4(context: context, text: ecommerce?.name ?? "", color: "primary"),
                  MyText.p(context: context, text: ecommerce?.type_ecommerce ?? "", color: "primary"),
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
  );

  Widget get _balance => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.h4(context: context, text: "Balance", color: "white"),
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
                    MyText.label(context: context, text: "Total ventas",color: "white"),
                    MyText.h4(context: context, text: "Bs. 1,200.50", color: "primary", fontWeight: true),
                  ],
                ),
                MyText.p(context: context, text: "+%20", color: "primary", fontWeight: true),
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(30)),
    ),
  );

  Widget get _products => Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          widgetOption(
              context: context,
              title: "PRODUCTOS",
              subtitle: "Lista de productos",
              icon: Icon(Icons.shopping_cart),
              callback: () => context.pushNamed(RoutesNames.products.name)),
          widgetOption(
              context: context,
              title: "CLIENTES",
              subtitle: "Cartera de clientes",
              icon: Icon(Icons.people_rounded),
              callback: () => context.go(RoutesNames.briefcase.path)),

        ],
      ),
    ),
  );

  Widget _loading() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Cargando información"),
        SizedBox(height: 10),
        CircularProgressIndicator()
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop:() async => await exitApp(context) ?? false,
        child: Scaffold(
            appBar: DefaultAppBar(),
            body: SafeArea(
              child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
                bloc: _bloc,
                listener: (context, state) {

                },
                builder: (context, state) {
                  print(state);

                  if(state is HomeScreenInitialState || state is HomeScreenLoadingState){
                    return _loading();
                  }
                  if(state is HomeScreenSuccessState){
                    return Column(
                      children: <Widget>[
                        _header(ecommerce: state.ecommerce),
                        SizedBox(height: 10),
                        // _balance,
                        SizedBox(height: 20),
                        _products
                      ],
                    );
                  }
                  if(state is HomeScreenErrorState){
                    return Center(child: Text(state.errorMessage ?? "Error al cargar la información"));
                  }
                  return Center(child: Text("Error al cargar la información 2"));

              },
),
            )
        ),
    );
  }
}
