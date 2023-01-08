import 'package:flutter_maintenance/commons/utils/error_util.dart';
import 'package:flutter_maintenance/data/models/request/request_attention_order_model.dart';
import 'package:flutter_maintenance/data/models/request/request_home_order_model.dart';
import 'package:flutter_maintenance/data/models/request/request_step_1_model.dart';
import 'package:flutter_maintenance/data/models/response/response_attention_order_model.dart';
import 'package:flutter_maintenance/data/models/response/response_home_order_model.dart';
import 'package:flutter_maintenance/data/models/response/response_step_1_model.dart';
import 'package:flutter_maintenance/data/services/order_services.dart';
import 'package:get/get.dart';

class OrderRepository {
  final OrderServices _orderServices = Get.find<OrderServices>();

  Future<ResponseHomeOrder?> getHomeOrders({required RequestHomeOrder request}) async {
    try {
      return await _orderServices.getHomeOrders(request: request);
    } catch (_) {
      Get.back();
      ErrorUtil.errorDialog((_.toString()));
      return null;
    }
  }

  Future<ResponseAttentionOrder?> getOrderById({required RequestAttentionOrder request}) async {
    try {
      return await _orderServices.getOrderById(request: request);
    } catch (_) {
      Get.back();
      ErrorUtil.errorDialog((_.toString()));
      return null;
    }
  }

  Future<ResponseStep1?> updateOrderStep1({required RequestStep1 request}) async {
    try {
      return await _orderServices.updateOrderStep1(request: request);
    } catch (_) {
      Get.back();
      ErrorUtil.errorDialog((_.toString()));
      return null;
    }
  }
}