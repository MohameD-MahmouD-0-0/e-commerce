import 'package:ecommerce/domain/entites/UserEntity.dart';

class AutheResultEntity{
  UserEntity? userEntity;
  String ?token;
  AutheResultEntity({this.userEntity,this.token});
}