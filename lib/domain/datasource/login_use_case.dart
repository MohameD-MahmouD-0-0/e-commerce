import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository/authe-reposatiory/reposatiory/authe_reposatiory_imp.dart';
import 'package:ecommerce/domain/entites/authe_result_entity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import 'package:ecommerce/domain/reposatiory/authe_reposatiory_contract.dart';

class LoginUseCase{
  AutheReposatioryContract autheReposatioryContract;
  LoginUseCase({required this.autheReposatioryContract});
  Future<Either<Failer,AutheResultEntity>> invoke(String Email, String Password){
     return autheReposatioryContract.login(Email, Password);
  }
}
