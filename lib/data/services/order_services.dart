import 'package:flutter_maintenance/commons/utils/network_util.dart';
import 'package:flutter_maintenance/data/models/request/request_attention_order_model.dart';
import 'package:flutter_maintenance/data/models/request/request_home_order_model.dart';
import 'package:flutter_maintenance/data/models/request/request_step_1_model.dart';
import 'package:flutter_maintenance/data/models/response/response_attention_order_model.dart';
import 'package:flutter_maintenance/data/models/response/response_home_order_model.dart';
import 'package:flutter_maintenance/data/models/response/response_step_1_model.dart';
import 'package:get/get.dart';

class OrderServices {
  final NetworkUtil _networkUtil = Get.find<NetworkUtil>();

  Future<ResponseHomeOrder> getHomeOrders({required RequestHomeOrder request}) async {
    return _networkUtil.post(
      url: 'mro_order/read_many',
      bodyRaw: request.toJson()
    ).then((res) => ResponseHomeOrder.fromJson(res));
  }

  Future<ResponseAttentionOrder> getOrderById({required RequestAttentionOrder request}) async {
    return _networkUtil.post(
      url: 'mro_order/read_one',
      bodyRaw: request.toJson()
    ).then((res) => ResponseAttentionOrder.fromJson(res));
  }

  Future<ResponseStep1> updateOrderStep1({required RequestStep1 request}) async {
    return _networkUtil.post(
        url: 'mro_order/update',
        bodyRaw: request.toJson()
    ).then((res) => ResponseStep1.fromJson(res));
  }
}