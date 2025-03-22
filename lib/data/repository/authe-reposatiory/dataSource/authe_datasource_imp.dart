import 'package:ecommerce/data/api/api_manger.dart';
import 'package:ecommerce/data/model/response/Register_Rsponse.dart';
import 'package:ecommerce/datasource/authe_datasource.dart';

class AutheRemoteDataSourceImp implements AutheRemoteDataSource{
  ApiManger apiManger ;
  AutheRemoteDataSourceImp({required this.apiManger});
  @override
  Future<RegisterResponse> register(String Name, String Phone, String Email, String Password, String RePassword, String) async {
    var reponse = await apiManger.register(Name, Phone, Email, Password, RePassword, String);
    return reponse;
  }

}