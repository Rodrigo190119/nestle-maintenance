import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/commons/utils/helpers.dart';
import 'package:flutter_maintenance/commons/utils/images_path_util.dart';
import 'package:flutter_maintenance/ui/views/root/home/home_view.dart';
import 'package:flutter_maintenance/ui/views/root/profile/profile_view.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  RxInt currentViewIndex = 0.obs;

  List<Widget>? _navigationPages;
  Map<int, Map<String, dynamic>>? _menuBottomBarItems;

  List<Widget>? get navigationPages => _navigationPages;
  Map<int, Map<String, dynamic>>? get menuBottomBarItems => _menuBottomBarItems;

  @override
  void onInit() {
    log('onInit() - RootController');
    _prepareNavigationPages();
    _prepareBottomBarItems();
    super.onInit();
  }

  @override
  void onReady() {
    log('onReady() - RootController');
    super.onReady();
  }

  void _prepareNavigationPages() {
    _navigationPages = const [
      HomeView(),
      ProfileView(),
    ];
  }

  void _prepareBottomBarItems() {
    _menuBottomBarItems = {
      0: {
        'label': AppTextKey.BOTTOMBAR_HOME_TEXT.tr,
        'icon': '${Assets.icons.path}${AssetsPathUtil.homeIcon}'
      },
      1: {
        'label': AppTextKey.BOTTOMBAR_PROFILE_TEXT.tr,
        'icon': '${Assets.icons.path}${AssetsPathUtil.profileIcon}'
      }
    };
  }

  void changeCurrentViewIndex(int index) {
    log('changeCurrentViewIndex() -> $index');
    currentViewIndex.value = index;
  }
}