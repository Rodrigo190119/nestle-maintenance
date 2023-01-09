import 'dart:developer';
import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/commons/utils/app_constants.dart';
import 'package:flutter_maintenance/commons/utils/error_util.dart';
import 'package:flutter_maintenance/commons/utils/preferences_util.dart';
import 'package:flutter_maintenance/data/models/request/request_login_model.dart';
import 'package:flutter_maintenance/data/models/response/response_login_model.dart';
import 'package:flutter_maintenance/data/repository/user_repository.dart';
import 'package:flutter_maintenance/routes/app_routes.dart';
import 'package:flutter_maintenance/ui/global_widgets/dialog/dialog_loader.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginController extends GetxController{
  final UserRepository _userRepository = Get.find<UserRepository>();
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  final int _textFormFieldsCount = 2;
  final List<bool> _active = [];
  final List<TextEditingController> _controller = [];
  final List<FocusNode> _focusNode = [];
  final List<String?> _errorText = [];
  bool _isVisiblePassword = false;

  Rx<String> deviceModel = ''.obs;
  Rx<String> appVersion = ''.obs;
  Rx<String> buildNumber = ''.obs;

  bool get isVisiblePassword => _isVisiblePassword;
  List<bool> get active => _active;
  List<TextEditingController> get controller => _controller;
  List<FocusNode> get focusNode => _focusNode;
  List<String?> get errorText => _errorText;

  @override
  void onInit() {
    _initializeControllers();
    _initializeDeviceAndPackageControllers();
    log('onInit() - LoginController');
    super.onInit();
  }

  @override
  void onReady() {
    log('onReady() - LoginController');
    super.onReady();
  }

  void _initializeControllers() {
    List.generate(_textFormFieldsCount, (_) => _active.add(false));
    List.generate(_textFormFieldsCount, (_) => controller.add(TextEditingController()));
    List.generate(_textFormFieldsCount, (_) => _focusNode.add(FocusNode()));
    List.generate(_textFormFieldsCount, (_) => _errorText.add(null));
  }

  void _initializeDeviceAndPackageControllers() async {
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
      deviceModel.value = iosDeviceInfo.utsname.machine ?? 'iOS device';
    } else {
      AndroidDeviceInfo androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
      deviceModel.value = androidDeviceInfo.model;
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
  }

  void showPassword() {
    _isVisiblePassword = !_isVisiblePassword;
    update(['textField']);
  }

  void onChange() {
    for (int i = 0; i < _textFormFieldsCount; i++) {
      _errorText[i] = null;
    }
    update(['textField']);
  }

  void validLoginForm() {
    bool usernameValid = controller[0].text.isNotEmpty;
    bool passwordValid = controller[1].text.isNotEmpty;

    _errorText[0] = usernameValid ? null : AppTextKey.TYPE_USERNAME_TEXT.tr;
    _errorText[1] = passwordValid ? null : AppTextKey.TYPE_PASSWORD_TEXT.tr;
    update(['textField']);
    if (usernameValid && passwordValid) {
      // if((_controller[0].text == _testUser || haveSession.value) && _controller[1].text == _testPassword) {
      //   processMockLogin();
      // } else {
      //   processLogin();
      // }
      _processLogin();
    }
  }

  void _processLogin() async {
    Get.dialog(const DialogLoader(), barrierDismissible: false);
    RequestLogin request = RequestLogin(
      username: controller[0].text,
      password: controller[1].text
    );
    ResponseLogin? response = await _userRepository.login(request: request);
    if(response != null) {
      Get.back();
      if(response.success!) {
        await Prefs.setString(AppConstants.TOKEN_KEY_PREFS, response.token!);
        await Prefs.setInt(AppConstants.USER_ID_PREFS, response.user!.id!);
        await Prefs.setString(AppConstants.USER_NAME_PREFS, response.user!.name!);
        Get.offNamed(AppRoutes.ROOT);
      } else { ErrorUtil.errorDialog(response.responseMessage!); }
    }
  }

  void copyDataToClipboard() async {
    await Clipboard.setData(ClipboardData(
      text: '${AppTextKey.VERSION_TEXT.tr}: ${appVersion.value}\n${AppTextKey.DEVICE_MODEL_TEXT.tr}: ${deviceModel.value}\n${AppTextKey.BUILD_NUMBER_TEXT.tr}: ${buildNumber.value}'
    ));
    log('copyDataToClipboard() -> copied!');
  }
}