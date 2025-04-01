import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository/authe-reposatiory/dataSource/authe_datasource_imp.dart';
import 'package:ecommerce/domain/datasource/authe_datasource.dart';

import '../../../../domain/entites/authe_result_entity.dart';
import '../../../../domain/entites/failer.dart';
import '../../../../domain/reposatiory/authe_reposatiory_contract.dart';

class AutheReposatioryImp implements AutheReposatioryContract {
  AutheRemoteDataSource autheDataSource;

  AutheReposatioryImp({required this.autheDataSource});

  @override
  Future<Either<Failer, AutheResultEntity>> register(String Name, String Phone,
      String Email, String Password, String RePassword, String) async {
    return await autheDataSource.register(
        Name, Phone, Email, Password, RePassword, String);
  }

  @override
  Future<Either<Failer, AutheResultEntity>> login(String Email, String Password) {
    return autheDataSource.login(Email, Password);
  }
}


