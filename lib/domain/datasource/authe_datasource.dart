import 'package:dartz/dartz.dart';
import '../entites/authe_result_entity.dart';
import '../entites/failer.dart';

abstract class AutheRemoteDataSource {
  Future<Either<Failer,AutheResultEntity>>register(String Name, String Phone, String Email, String Password,
      String RePassword, String);
  Future<Either<Failer,AutheResultEntity>>login( String Email, String Password);
}