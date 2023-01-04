import 'package:flutter_maintenance/data/models/entities/user_entity.dart';

class ResponseLogin {
  bool? success;
  String? responseMessage;

  UserEntity? user;
  String? token;

  ResponseLogin({
    this.success = false,
    this.responseMessage = '',
    this.user,
    this.token,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) {
    return ResponseLogin(
      success: json['success'],
      responseMessage: json['msg'],
      user: json['result'] != null ? UserEntity.fromJson(json['result']) : null,
      token: json['access_token']
    );
  }
}