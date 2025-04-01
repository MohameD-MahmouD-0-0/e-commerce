import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/authe_result_entity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

abstract class AutheReposatioryContract{
  Future<Either<Failer,AutheResultEntity>>register(String Name, String Phone, String Email, String Password,
      String RePassword, String);
  Future<Either<Failer,AutheResultEntity>>login(String Email, String Password,);
}