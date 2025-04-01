import 'package:ecommerce/data/model/response/Register_Rsponse_Dto.dart';
import 'package:ecommerce/domain/entites/authe_result_entity.dart';

abstract class RegisterStates{}
class InitalRegisterState extends RegisterStates{}
class LodingRegisterState extends RegisterStates{
  String LodingMessage;
  LodingRegisterState({required this.LodingMessage});
}
class ErrorRegisterState extends RegisterStates{
  String errorMessage ;
  ErrorRegisterState({required this.errorMessage});
}
class SucessRegisterState extends RegisterStates{
  AutheResultEntity registerResponse;
  SucessRegisterState({required this.registerResponse});
}
