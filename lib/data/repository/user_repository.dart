import 'package:flutter_maintenance/commons/utils/error_util.dart';
import 'package:flutter_maintenance/data/models/request/request_login_model.dart';
import 'package:flutter_maintenance/data/models/response/response_login_model.dart';
import 'package:flutter_maintenance/data/services/user_services.dart';
import 'package:get/get.dart';

class UserRepository {
  final UserServices _userServices = Get.find<UserServices>();

  Future<ResponseLogin?> login({required RequestLogin request}) async {
    try {
      return await _userServices.postLogin(request: request);
    } catch (_) {
      Get.back();
      ErrorUtil.errorDialog((_.toString()));
      return null;
    }
  }
}