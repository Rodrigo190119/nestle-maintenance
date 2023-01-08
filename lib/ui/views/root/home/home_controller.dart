import 'dart:developer';

import 'package:flutter_maintenance/data/models/arguments/attention_order_arguments.dart';
import 'package:flutter_maintenance/routes/app_routes.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maintenance/commons/theme/app_text_key.dart';
import 'package:flutter_maintenance/commons/utils/app_constants.dart';
import 'package:flutter_maintenance/commons/utils/error_util.dart';
import 'package:flutter_maintenance/commons/utils/preferences_util.dart';
import 'package:flutter_maintenance/data/models/entities/home_order_entity.dart';
import 'package:flutter_maintenance/data/models/request/request_home_order_model.dart';
import 'package:flutter_maintenance/data/models/response/response_home_order_model.dart';
import 'package:flutter_maintenance/data/repository/order_repository.dart';
import 'package:flutter_maintenance/ui/global_widgets/dialog/dialog_loader.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class HomeController extends GetxController {
  final OrderRepository _orderRepository = Get.find<OrderRepository>();

  List<HomeOrderEntity> _homeOrdersList = [];
  List<HomeOrderEntity> _tempOrdersList = [];

  final AttentionOrderArguments _attentionOrderArguments = AttentionOrderArguments();
  final int _textFormFieldsCount = 1;
  final List<bool> _active = [];
  final List<TextEditingController> _controller = [];
  final List<FocusNode> _focusNode = [];
  final List<String?> _errorText = [];

  List<HomeOrderEntity> get homeOrdersList => _homeOrdersList;
  List<HomeOrderEntity> get tempOrdersList => _tempOrdersList;
  List<bool> get active => _active;
  List<TextEditingController> get controller => _controller;
  List<FocusNode> get focusNode => _focusNode;
  List<String?> get errorText => _errorText;

  @override
  void onInit() {
    log('onInit() - HomeController');
    _initializeControllers();
    super.onInit();
  }

  @override
  void onReady() {
    log('onReady() - HomeController');
    _processGetHomeOrders();
    super.onReady();
  }

  void _initializeControllers() {
    List.generate(_textFormFieldsCount, (_) => _active.add(false));
    List.generate(_textFormFieldsCount, (_) => controller.add(TextEditingController()));
    List.generate(_textFormFieldsCount, (_) => _focusNode.add(FocusNode()));
    List.generate(_textFormFieldsCount, (_) => _errorText.add(null));
  }

  void _processGetHomeOrders() async {
    Get.dialog(const DialogLoader(), barrierDismissible: false);
    RequestHomeOrder request = RequestHomeOrder(
      userId: Prefs.getInt(AppConstants.USER_ID_PREFS)
    );
    ResponseHomeOrder? response = await _orderRepository.getHomeOrders(request: request);
    if(response != null) {
      Get.back();
      if(response.success!) {
        _homeOrdersList = response.homeOrderEntityList!;
        _tempOrdersList = response.homeOrderEntityList!;
      } else { ErrorUtil.errorDialog(response.responseMessage!); }
    }
    update();
  }

  void onChange() {
    for (int i = 0; i < _textFormFieldsCount; i++) {
      _errorText[i] = null;
    }
    update(['textField']);
    filterOrdersByText(_controller[0].text);
  }

  void filterOrdersByText(String text){
    log('filterOrdersByText() -> $text');
    List<HomeOrderEntity>? filteredOrders = [];
    if(text.isNotEmpty) {
      filteredOrders = _tempOrdersList.where(
              (element) =>
          (element.orderNumber!.toLowerCase().contains(text.toLowerCase())) ||
              (element.customerName!.toLowerCase().contains(text.toLowerCase()))
      ).toList();
      _homeOrdersList = filteredOrders;
    } else{
      _homeOrdersList = _tempOrdersList;
    }
    update();
  }

  void goToAttentionOrder({required HomeOrderEntity entity}) {
    _attentionOrderArguments.orderId = entity.id;
    _attentionOrderArguments.orderNumber = entity.orderNumber;
    _attentionOrderArguments.priority = entity.priority;
    Get.toNamed(AppRoutes.ATTENTION_ORDER_STEP_1, arguments: _attentionOrderArguments);
  }

  Future<void> openPhoneCaller(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if(await url_launcher.canLaunchUrl(launchUri)) {
      log('openPhoneCaller() -> launch!');
      await url_launcher.launchUrl(launchUri);
    } else { log('openPhoneCaller() -> can not launch!');}
  }

  Future<void> openGoogleMaps(String address) async {
    if (address != '') {
      final Uri launchUri = Uri.parse(address);
      if(await url_launcher.canLaunchUrl(launchUri)) {
        log('openGoogleMaps() -> launch!');
        await url_launcher.launchUrl(launchUri,
            mode: url_launcher.LaunchMode.externalApplication);
      } else { log('openGoogleMaps() -> can not launch!');}
    }
  }
}