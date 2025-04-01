import 'package:ecommerce/data/model/response/UserDto.dart';

import '../../../domain/entites/authe_result_entity.dart';

/// message : "success"
/// user : {"name":"rana","email":"rana@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MjgzNTkwZmM1NTUzYzMzNzdjMDNhNyIsIm5hbWUiOiJyYW5hIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NDMxNzExMDYsImV4cCI6MTc1MDk0NzEwNn0.y5OTkpGHhMKP0WCdfsWU6HMGgV8d5TUbSN7KIXFx6Fk"

class LoginResponseDto {
  LoginResponseDto({
      this.message, 
      this.user,
      this.statusMsg,
      this.token,});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];

  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AutheResultEntity toAutheResultEntity(){
    return AutheResultEntity(token: token,userEntity: user?.toUserEntity());
  }
}


