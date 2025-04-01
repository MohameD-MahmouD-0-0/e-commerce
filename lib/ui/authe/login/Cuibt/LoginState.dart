import 'package:ecommerce/data/model/response/Register_Rsponse_Dto.dart';
import 'package:ecommerce/domain/entites/authe_result_entity.dart';

abstract class LoginState{}
class InitalLoginState extends LoginState{}
class LodingLoginState extends LoginState{
  String LodingMessage;
  LodingLoginState({required this.LodingMessage});
}
class ErrorLoginState extends LoginState{
  String errorMessage ;
  ErrorLoginState({required this.errorMessage});
}
class SucessLoginState extends LoginState{
  AutheResultEntity loginResponse;
  SucessLoginState({required this.loginResponse});
}