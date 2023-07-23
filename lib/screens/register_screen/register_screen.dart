import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pedidos_express/models/user/user_model.dart';
import 'package:pedidos_express/screens/register_screen/register_bloc.dart';
import 'package:pedidos_express/styles/text.dart';

import '../../styles/color.dart';
import '../../utils/routes_name.dart';
import '../../widgets/textButtons.dart';

class RegisterScreen extends StatefulWidget {
  final RegisterBloc bloc;
  const RegisterScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

   RegisterBloc get _bloc => widget.bloc;

  @override
  initState(){
    super.initState();
  }

  Widget _name({ required bool isLoading }) => Column(
    children: [
      Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        shadowColor: Theme.of(context).primaryColorLight,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _bloc.name,
                validator: _bloc.validateName,
                enabled: !isLoading,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorWidth: 5,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.people_alt),
                  suffixIconColor: ColorUtil.gray,
                  hintText: "Nombre",
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _password({ required bool isLoading }) => Column(
    children: [
      Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        shadowColor: Theme.of(context).primaryColorLight,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _bloc.password,
                validator: _bloc.validatePassword,
                enabled: !isLoading,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorWidth: 5,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.password),
                  suffixIconColor: ColorUtil.gray,
                  hintText: "Contraseña",
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _email({ required bool isLoading }) => Column(
    children: [
      Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        shadowColor: Theme.of(context).primaryColorLight,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _bloc.email,
                validator: _bloc.validateEmail,
                enabled: !isLoading,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorWidth: 5,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email_outlined),
                  suffixIconColor: ColorUtil.gray,
                  hintText: "Correo electrónico",
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _address({ required bool isLoading }) =>
        Material(
          borderRadius: BorderRadius.circular(25),
          elevation: 5,
          shadowColor: Theme.of(context).primaryColorLight,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _bloc.address,
                  validator: _bloc.validateAddress,
                  enabled: !isLoading,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  cursorWidth: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorUtil.white,
                    suffixIcon: Icon(Icons.account_tree),
                    suffixIconColor: ColorUtil.gray,
                    hintText: "Dirección",
                  ),
                ),
              ),
            ],
          ),
        );

  void _goLogin(){
    context.goNamed(RoutesNames.login.name);
  }

  Widget _button({ required bool isLoading }) => Row(
    children: [
      Expanded(child:
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: !isLoading ?
          MaterialStatePropertyAll(Theme.of(context).primaryColor) :
          MaterialStatePropertyAll(Colors.grey),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
        ),
        onPressed:  !isLoading ? _bloc.register : null,
        child: isLoading ?
        CircularProgressIndicator(color: Colors.white):
        Text('Crear una cuenta'),
      ),)
    ],
  );

   void _dialogError({String? errorMessage}){
     showDialog(context: context, builder: (_) => AlertDialog(
       title: Text("Error al registrar el usuario"),
       content: Text(errorMessage ?? "", style: TextStyle(color: Colors.black45),),
     ));
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorUtil.secondary_light),
          backgroundColor: ColorUtil.transparent,
          title: MyText.h6(context: context, text: "Crear cuenta", fontWeight: false, color: ""),
          centerTitle: true,
        ),
        body: BlocConsumer<RegisterBloc, RegisterState>(
          bloc: _bloc,
          listener: (_, state){
            if(state is RegisterScreenSuccessState){
              _goLogin();
            }
            if(state is RegisterScreenErrorState){
              _dialogError(errorMessage: state.errorMessage);
            }
          },
          builder: (_, state){
            bool isLoading = state is RegisterScreenLoadingState;

            return Form(
              key: _bloc.formKey,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Column(children: [
                            _name(isLoading: isLoading),
                            SizedBox(height: 25),
                            _address(isLoading: isLoading),
                            SizedBox(height: 25),
                            _email(isLoading: isLoading),
                            SizedBox(height: 25),
                            _password(isLoading: isLoading),
                            SizedBox(height: 25),
                            _button(isLoading: isLoading)
                          ],),
                          Column(children: [
                            SizedBox(height: 10),
                            TextButtonTitleRef(
                                title: '¿Ya eres usuario de la plataforma?',
                                text: 'Inicia sesión',
                                callback: () => context.goNamed(RoutesNames.register.name)
                            ),
                            SizedBox(height: 20),
                          ],)
                        ]),
                  ),
                ),
              ),
            );
          },
        ),
      ));
  }
}
