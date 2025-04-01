import 'package:ecommerce/domain/entites/authe_result_entity.dart';
import 'Error.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti1l2@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZGRkMzY0OThkMzY2ZGIxYTBkMGMyYSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQyNTkwODIwLCJleHAiOjE3NTAzNjY4MjB9.PwuAEgEM82gZ0rC6UwcxLz7fzRbXuhjQPsDcfB7NnYc"

class RegisterResponseDto {
  RegisterResponseDto({
      this.message,
      this.user,
      this.statusMsg,
      this.error,
      this.token,});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;

    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    map['token'] = token;

    return map;
  }
AutheResultEntity toAutheResultEntity(){
    return AutheResultEntity(token: token,userEntity: user?.toUserEntity());
}
}