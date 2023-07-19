import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedidos_express/screens/login_screen/login_screen_bloc.dart';
import 'package:pedidos_express/styles/color.dart';
import 'package:pedidos_express/styles/text.dart';
import 'package:pedidos_express/utils/routes_name.dart';
import 'package:go_router/go_router.dart';
import 'package:pedidos_express/widgets/showErrorInput.dart';
import 'package:pedidos_express/widgets/textButtons.dart';


class LoginScreen extends StatefulWidget {
  LoginScreenBloc bloc;
  LoginScreen({super.key, required this.bloc});

  @override
  State<LoginScreen> createState() => _Login();
}

class _Login extends State<LoginScreen> {
  LoginScreenBloc get _bloc => widget.bloc;
  bool isObscure = true;
  
  void handlerObscure(){
    setState(() {
      isObscure = !isObscure;
    });
  }
  @override
  void initState() {
    super.initState();
  }

  Widget _password({required bool isLoading}) => Column(
    children: [
      Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        shadowColor: Theme.of(context).primaryColorLight,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                  enabled: !isLoading,
                  controller: _bloc.passwordController,
                  // onChanged: (text) => _bloc.updatePassword(text),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _bloc.validatePassword,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  obscureText: isObscure,
                  cursorWidth: 5,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: handlerObscure,
                        icon: Icon(
                            isObscure ?
                            Icons.visibility_off :
                            Icons.visibility), 
                        color: Theme.of(context).primaryColorLight),
                    border: OutlineInputBorder(),
                    hintText: 'Contraseña',
                  )
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _username({required bool isLoading}) => Column(
    children: [
      Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        shadowColor: Theme.of(context).primaryColorLight,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                enabled: !isLoading,
                controller: _bloc.userNameController,
                // onChanged: (text) => _bloc.updateUserName(text),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: _bloc.validateUserName,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                cursorWidth: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorUtil.white,
                  suffixIcon: Icon(Icons.email_outlined, color: Theme.of(context).primaryColorLight,),
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



  Widget _button({required bool isLoading}) => Row(
    children: [
      Expanded(child:
      ElevatedButton(
        style: ButtonStyle(
            backgroundColor: !isLoading ?
              MaterialStatePropertyAll(Theme.of(context).primaryColor) :
              MaterialStatePropertyAll(Colors.grey),
            elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          enableFeedback: isLoading
        ),
        onPressed: () => !isLoading ? _bloc.loginService() : null,
        child: isLoading ? CircularProgressIndicator(color: Colors.white) :  Text('Iniciar sesión'),
      ),)
    ],
  );

  void _dialogError({String? errorMessage}){
    showDialog(context: context, builder: (_) => AlertDialog(
      title: Text("Error al iniciar sesión"),
      content: Text(errorMessage ?? "", style: TextStyle(color: Colors.black45),),
    ));
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorUtil.secondary_light),
          backgroundColor: ColorUtil.transparent,
          title: MyText.h6(context: context, text: "Iniciar sesión", fontWeight: false, color: ""),
          centerTitle: true,
        ),
        body: BlocConsumer<LoginScreenBloc, LoginScreenState>(
          bloc: _bloc,
          listener: (context, state) {
            if(state is LoginScreenSuccessState){
              context.goNamed(RoutesNames.home.name);
            }
            if(state is LoginScreenErrorState){
              _dialogError(errorMessage: state.errorMessage);
            }
          },
          builder: (context, state) {

            bool isLoading = state is LoginScreenLoadingState;

            return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 40),
                        Form(
                          key: _bloc.formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              _username(isLoading: isLoading),
                              SizedBox(height: 20),
                              _password(isLoading: isLoading),
                              SizedBox(height: 20),
                              _button(isLoading: isLoading),
                            ],
                          )
                        ),
                        Column(children: [
                          // TextButtonRef(message: "¿Haz olvidado tu contraseña?"),
                          SizedBox(height: 10),
                          TextButtonTitleRef(
                              title: '¿No eres usuario de la plataforma?',
                              text: 'Crea una cuenta',
                              callback: () => context.goNamed(RoutesNames.register.name)
                          ),
                          SizedBox(height: 20),
                        ],)
                      ],
                    ),
                  ),
                );
          },
          )
        );
  }
}

