import 'package:ecommerce/data/model/response/Error.dart';

/// statusMsg : "fail"
/// message : "Account Already Exists"

class RegisterErrorResponse {
  RegisterErrorResponse({
      this.statusMsg,
      this.error,
      this.message,});

  RegisterErrorResponse.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
  }
  String? statusMsg;
  String? message;
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['errors'] = error;

    return map;
  }

}