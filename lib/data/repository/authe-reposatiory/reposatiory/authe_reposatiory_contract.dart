import 'package:ecommerce/data/model/response/Register_Rsponse.dart';

abstract class AutheReposatioryContract{
  Future<RegisterResponse>register(String Name, String Phone, String Email, String Password,
      String RePassword, String);
}