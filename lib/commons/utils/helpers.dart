import 'dart:ui';

import 'package:flutter_maintenance/commons/theme/app_colors.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/commons/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum Assets {
  fonts,
  icons,
  images,
  json,
}

class Helpers {
  static String getFormattedDateTimeByValue(String? stringDateTime) {
    final f = DateFormat('dd/MM/yyyy hh:mm a');
    DateTime? dateTime = DateTime.tryParse(stringDateTime ?? '');
    return dateTime != null ? f.format(dateTime) : '...';
  }

  static String? getFormattedDateTimeForRequest(String? stringDateTime) {
    String dateTimeToString = '';
    DateTime? dateTime = DateTime.tryParse(stringDateTime ?? '');
    if(dateTime != null) {
      dateTimeToString = dateTime.toUtc().toString();
      return dateTimeToString;
    }
    return null;
  }

  static String getStateTextByValue(String? state) {
    Map<String, String> stateText = {
      AppConstants.STEP_1_DRAFT: AppTextKey.STEP_1_ORDER_STATE_DRAFT_TEXT
    };
    return stateText[state] ?? '';
  }

  static String getPriorityTextByValue(String? priority) {
    Map<String, String> priorityText = {
      AppConstants.LOW_PRIORITY: AppTextKey.ORDER_CARD_PRIORITY_LOW_TEXT,
      AppConstants.NORMAL_PRIORITY: AppTextKey.ORDER_CARD_PRIORITY_NORMAL_TEXT,
      AppConstants.HIGH_PRIORITY: AppTextKey.ORDER_CARD_PRIORITY_HIGH_TEXT
    };
    return priorityText[priority] ?? '';
  }

  static String getStepHeaderTitle(int currentStep) {
    Map<int, String> stepTitle = {
      1: AppTextKey.ORDER_ATTENTION_STEP_1_TITLE.tr,
      2: AppTextKey.ORDER_ATTENTION_STEP_2_TITLE.tr,
      3: AppTextKey.ORDER_ATTENTION_STEP_3_TITLE.tr,
      4: AppTextKey.ORDER_ATTENTION_STEP_4_TITLE.tr,
      5: AppTextKey.ORDER_ATTENTION_STEP_5_TITLE.tr
    };
    if((stepTitle[currentStep] ?? '').length > 7) {
      String reducedTitle = '${stepTitle[currentStep]!.substring(0, 7)}...';
      return reducedTitle;
    }
    return stepTitle[currentStep] ?? '';
  }

  static Color getStepHeaderColor(int currentStep, int pos) {
    if(currentStep == pos + 1) return AppColors.kPrimary;
    return AppColors.kTextStepDisableBackground;
  }
}

extension AssetsPath on Assets {
  String get path {
    switch (this) {
      case Assets.fonts:
        return "assets/fonts/";
      case Assets.icons:
        return "assets/icons/";
      case Assets.images:
        return "assets/images/";
      case Assets.json:
        return "assets/json/";
      default:
        return "No found path";
    }
  }
}