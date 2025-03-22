import 'package:ecommerce/ui/authe/register/Cuibt/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates>{
  RegisterScreenViewModel():super(InitalRegisterState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;
  void register(){
    if (formKey.currentState!.validate()) {

    }
  }
}