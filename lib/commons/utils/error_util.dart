import 'package:flutter/foundation.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/commons/utils/helpers.dart';
import 'package:flutter_maintenance/ui/global_widgets/dialog/custom_dialog.dart';
import 'package:get/get.dart';

class ErrorUtil {
  static void errorDialog(String message, {
    String? title,
    String? button,
    VoidCallback? onTapButtonDialog,
    VoidCallback? onTapButtonRetry,
    String? image,
    bool? dismissible,
    bool? isLogin
  }) {
    Get.dialog(
      CustomDialog(
          isDismissibleDialog: (dismissible != null)
              ? dismissible
              : ErrorUtil.getDismissibleDialog(message),
          imagePathBanner:
          (image != null) ? image : ErrorUtil.getErrorImage(message),
          title: title == null
              ? ErrorUtil.getErrorTitle(message)
              : ErrorUtil.getErrorTitle(title),
          content: ErrorUtil.getErrorMessage(message),
          isOnlyPrimary: true,
          textPrimaryButton: (button != null) ? button : getTextButton(message),
          onTapButton: (onTapButtonRetry != null && message.contains('NOT_INTERNET_EXCEPTION'))
              ? (){Get.back(); onTapButtonRetry();}
              : (onTapButtonDialog != null)
              ? onTapButtonDialog
              : () {
            Get.back();
          }),
      barrierDismissible: (dismissible != null)
          ? dismissible
          : ErrorUtil.getDismissibleDialog(message),
    );
  }

  static String getErrorImage(String msg) {
    String value;

    if (msg.contains('NOT_INTERNET_EXCEPTION')) {
      return "${Assets.images.path}no_internet_connection.png";
    }

    if (msg.contains('TIME_OUT')) {
      return "${Assets.images.path}time_out.png";
    }

    switch (msg) {
      case 'SERVER_ERROR':
        value = "${Assets.images.path}error.png";
        break;
      default:
        value = "${Assets.images.path}error.png";
        break;
    }

    return value;
  }

  static String getErrorTitle(String msg) {
    String value = '';

    if (msg.contains('NOT_INTERNET_EXCEPTION')) {
      return 'Ooops!';
    }

    return value;
  }

  static String getErrorMessage(String msg) {
    String value = '';

    if (msg.contains('NOT_INTERNET_EXCEPTION')) {
      return 'NO HAY INTERNET';
    }

    return msg;
  }

  static String getTextButton(String msg) {
    String value = '';

    if (msg.contains('NOT_INTERNET_EXCEPTION')) {
      return 'REINTENTAR';
    }

    if (msg.contains('TIME_OUT')) {
      return 'REINTENTAR';
    }

    return value;
  }

  static bool getDismissibleDialog(String msg) {
    bool value;

    if (msg.contains('NOT_INTERNET_EXCEPTION')) {
      return false;
    }

    if (msg.contains('denied_access')) {
      return false;
    }

    switch (msg) {
      case 'TIME_OUT':
        value = true;
        break;
      case 'INVALID_TOKEN':
        value = false;
        break;
      case 'SERVER_ERROR':
        value = false;
        break;
      default:
        value = true;
        break;
    }

    return value;
  }
}