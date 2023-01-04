import 'dart:developer';

import 'package:flutter_maintenance/routes/app_routes.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    log('onInit() - ProfileController');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    log('onReady() - ProfileController');
  }

  void closeSessionAndGoToLogin() {
    log('goToLogin()');
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}