import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/failer.dart';

import '../../data/repository/authe-reposatiory/reposatiory/authe_reposatiory_imp.dart';
import '../entites/authe_result_entity.dart';
import '../reposatiory/authe_reposatiory_contract.dart';

class RegisterUseCase{
  AutheReposatioryContract autheReposatioryContract;
  RegisterUseCase({required this.autheReposatioryContract});
  Future<Either<Failer,AutheResultEntity>> invoke(String Name, String Phone, String Email,
      String Password, String RePassword){
    return autheReposatioryContract.register(Name, Phone, Email, Password, RePassword, String);
  }
}
