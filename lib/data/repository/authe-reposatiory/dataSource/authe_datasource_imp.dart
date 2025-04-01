import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/api_manger.dart';
import '../../../../domain/datasource/authe_datasource.dart';
import '../../../../domain/entites/authe_result_entity.dart';
import '../../../../domain/entites/failer.dart';

class AutheRemoteDataSourceImp implements AutheRemoteDataSource{
  ApiManger apiManger ;
  AutheRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failer,AutheResultEntity>> register(String Name, String Phone, String Email, String Password, String RePassword, String) async {
    var either = await apiManger.register(Name, Phone, Email, Password, RePassword);
    return either.fold((l){
      return Left(Failer(errorMessage: l.errorMessage));
    }, (response){
      return Right(response.toAutheResultEntity());
    });
  }

  @override
  Future<Either<Failer, AutheResultEntity>> login(String Email, String Password) async {
    var either = await apiManger.login(Email, Password);
    return either.fold((l){
      return Left(Failer(errorMessage: l.errorMessage));
    },(response){
      return Right(response.toAutheResultEntity());
    });
  }
}

