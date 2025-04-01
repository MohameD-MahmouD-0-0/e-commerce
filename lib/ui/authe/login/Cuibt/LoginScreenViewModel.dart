import 'package:ecommerce/domain/datasource/login_use_case.dart';
import 'package:ecommerce/ui/authe/login/Cuibt/LoginState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginScreenViewModel({required this.loginUseCase}) : super(InitalLoginState());
  var formKey = GlobalKey<FormState>();
  bool isObsure= true;
  var emailController = TextEditingController(text: 'rana@route.com');
  var passwordController = TextEditingController(text: '123456');
  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LodingLoginState(LodingMessage: "Loding..."));
      var either = await loginUseCase.invoke(emailController.text, passwordController.text);
       either.fold((l){
        emit(ErrorLoginState(errorMessage: l.errorMessage));
      }, (response){
        emit(SucessLoginState(loginResponse: response));
      });
    }
  }
}