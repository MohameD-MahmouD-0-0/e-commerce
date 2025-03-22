import 'package:ecommerce/data/model/response/Register_Rsponse.dart';
import 'package:ecommerce/datasource/authe_datasource.dart';
import 'package:ecommerce/data/repository/authe-reposatiory/reposatiory/authe_reposatiory_contract.dart';

class AutheReposatioryImp implements AutheReposatioryContract{
  AutheRemoteDataSource autheDataSource ;
  AutheReposatioryImp({required this.autheDataSource});
  @override
  Future<RegisterResponse> register(String Name, String Phone, String Email, String Password, String RePassword, String) async {
  return await autheDataSource.register(Name, Phone, Email, Password, RePassword, String);
  }}