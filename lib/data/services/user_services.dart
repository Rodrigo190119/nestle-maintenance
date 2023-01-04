import 'package:flutter_maintenance/commons/utils/network_util.dart';
import 'package:flutter_maintenance/data/models/request/request_login_model.dart';
import 'package:flutter_maintenance/data/models/response/response_login_model.dart';
import 'package:get/get.dart';

class UserServices {
  final NetworkUtil _networkUtil = Get.find<NetworkUtil>();

  Future<ResponseLogin> postLogin({required RequestLogin request}) async {
    return _networkUtil.post(
      url: 'auth/app',
      bodyRaw: request.toJson()
    ).then((res) => ResponseLogin.fromJson(res));
  }
}