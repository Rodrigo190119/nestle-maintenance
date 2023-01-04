import 'dart:developer';

import 'package:flutter_maintenance/commons/utils/app_constants.dart';
import 'package:flutter_maintenance/commons/utils/error_util.dart';
import 'package:flutter_maintenance/commons/utils/preferences_util.dart';
import 'package:flutter_maintenance/data/models/request/request_attention_order_model.dart';
import 'package:flutter_maintenance/data/models/response/response_attention_order_model.dart';
import 'package:flutter_maintenance/data/repository/order_repository.dart';
import 'package:flutter_maintenance/ui/global_widgets/dialog/dialog_loader.dart';
import 'package:get/get.dart';

class AttentionController extends GetxController {
  final OrderRepository _orderRepository = Get.find<OrderRepository>();

  @override
  void onReady() {
    log('onReady() - AttentionController');
    _processGetAttentionOrder();
    super.onReady();
  }

  void _processGetAttentionOrder() async {
    Get.dialog(const DialogLoader(), barrierDismissible: false);
    RequestAttentionOrder request = RequestAttentionOrder(
      userId: Prefs.getInt(AppConstants.USER_ID_PREFS),
      orderId: 1
    );
    ResponseAttentionOrder? response = await _orderRepository.getOrderById(request: request);
    if(response != null) {
      Get.back();
      if(response.success!) {

      } else { ErrorUtil.errorDialog(response.responseMessage!); }
    }
    update();
  }
}