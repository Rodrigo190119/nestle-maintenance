import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/utils/app_constants.dart';
import 'package:flutter_maintenance/commons/utils/preferences_util.dart';
import 'package:flutter_maintenance/routes/app_routes.dart';
import 'package:get/get.dart';

class LoginMiddleware extends GetMiddleware {

  bool _checkIfUserHasSessionSaved(){
    bool existToken = Prefs.getString(AppConstants.TOKEN_KEY_PREFS).isNotEmpty;
    bool existUserId = Prefs.getInt(AppConstants.USER_ID_PREFS) != 0;
    return existToken && existUserId;
  }

  @override
  RouteSettings? redirect(String? route){
    bool userHasSession = _checkIfUserHasSessionSaved();
    if(userHasSession) return const RouteSettings(name: AppRoutes.ROOT);
    return null;
  }

}