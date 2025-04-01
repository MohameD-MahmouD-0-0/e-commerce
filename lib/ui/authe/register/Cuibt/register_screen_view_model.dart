import 'package:ecommerce/ui/authe/register/Cuibt/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/datasource/register_usecase.dart';


class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterScreenViewModel({required this.registerUseCase})
      : super(InitalRegisterState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'rana');
  var emailController = TextEditingController(text: 'rana@route.com');
  var passwordController = TextEditingController(text: '123456');
  var confirmationPasswordController = TextEditingController(text: '123456');
  var phoneController = TextEditingController(text: '01022554477');
  bool isObscure = true;
RegisterUseCase registerUseCase;
  void register() async {
    if (formKey.currentState!.validate()) {
      emit(LodingRegisterState(LodingMessage: "Loding..."));
      var either = await registerUseCase.invoke(
          nameController.text, phoneController.text, emailController.text,
          passwordController.text, confirmationPasswordController.text);
      either.fold((l){
        emit(ErrorRegisterState(errorMessage: l.errorMessage));
      }, (response){
        emit(SucessRegisterState(registerResponse: response));
    });
  }
  }
}

