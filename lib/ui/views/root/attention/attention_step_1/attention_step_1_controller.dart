import 'dart:developer';

import 'package:flutter_maintenance/commons/utils/app_constants.dart';
import 'package:flutter_maintenance/commons/utils/error_util.dart';
import 'package:flutter_maintenance/commons/utils/preferences_util.dart';
import 'package:flutter_maintenance/data/models/arguments/attention_order_arguments.dart';
import 'package:flutter_maintenance/data/models/request/request_attention_order_model.dart';
import 'package:flutter_maintenance/data/models/request/request_step_1_model.dart';
import 'package:flutter_maintenance/data/models/response/response_attention_order_model.dart';
import 'package:flutter_maintenance/data/models/response/response_step_1_model.dart';
import 'package:flutter_maintenance/data/repository/order_repository.dart';
import 'package:flutter_maintenance/routes/app_routes.dart';
import 'package:flutter_maintenance/ui/global_widgets/dialog/dialog_loader.dart';
import 'package:get/get.dart';

class AttentionStep1Controller extends GetxController {
  final OrderRepository _orderRepository = Get.find<OrderRepository>();

  AttentionOrderArguments _attentionOrderArguments = AttentionOrderArguments();
  final RxString _rxOrderRequestedDate = '...'.obs;
  final RxString _rxOrderState = '...'.obs;
  final RxString _rxCustomerName = '...'.obs;
  final RxString _rxCustomerTelephone = '...'.obs;
  final RxString _rxCustomerAddress = '...'.obs;
  final RxString _rxEquipmentCode = '...'.obs;
  final RxString _rxEquipmentName = '...'.obs;
  final RxString _rxRequestCause = '...'.obs;
  final RxString _rxOrderRealInitDate = ''.obs;

  AttentionOrderArguments get attentionOrderArguments => _attentionOrderArguments;
  RxString get rxOrderRequestedDate => _rxOrderRequestedDate;
  RxString get rxOrderState => _rxOrderState;
  RxString get rxCustomerName => _rxCustomerName;
  RxString get rxCustomerTelephone => _rxCustomerTelephone;
  RxString get rxCustomerAddress => _rxCustomerAddress;
  RxString get rxEquipmentCode => _rxEquipmentCode;
  RxString get rxEquipmentName => _rxEquipmentName;
  RxString get rxRequestCause => _rxRequestCause;
  RxString get rxOrderRealInitDate => _rxOrderRealInitDate;

  @override
  void onInit() {
    _getArguments();
    log('onInit() - AttentionStep1Controller');
    super.onInit();
  }

  @override
  void onReady() {
    _processGetAttentionOrder();
    log('onReady() - AttentionStep1Controller');
    super.onReady();
  }

  void _getArguments(){
    _attentionOrderArguments = Get.arguments as AttentionOrderArguments;
    log('_getArguments -> $_attentionOrderArguments');
  }

  void _processGetAttentionOrder() async {
    Get.dialog(const DialogLoader(), barrierDismissible: false);
    RequestAttentionOrder request = RequestAttentionOrder(
      userId: Prefs.getInt(AppConstants.USER_ID_PREFS),
      orderId: _attentionOrderArguments.orderId!
    );
    ResponseAttentionOrder? response = await _orderRepository.getOrderById(request: request);
    if(response != null) {
      Get.back();
      if(response.success!) {
        _attentionOrderArguments.orderId = response.order!.orderId;
        _attentionOrderArguments.orderNumber = response.order!.orderNumber;
        _attentionOrderArguments.orderState = response.order!.orderState;
        _attentionOrderArguments.equipmentId = response.order!.equipmentId;
        _attentionOrderArguments.equipmentName = response.order!.equipmentName;
        _attentionOrderArguments.equipmentCode = response.order!.equipmentCode;
        _attentionOrderArguments.temperature = response.order!.temperature;
        _attentionOrderArguments.failureId = response.order!.failureId;
        _attentionOrderArguments.problemId = response.order!.problemId;
        _attentionOrderArguments.causeId = response.order!.causeId;
        _attentionOrderArguments.solutionId = response.order!.solutionId;
        _attentionOrderArguments.failureDescription = response.order!.failureDescription;
        _attentionOrderArguments.problemDescription = response.order!.problemDescription;
        _attentionOrderArguments.causeDescription = response.order!.causeDescription;
        _attentionOrderArguments.solutionDescription = response.order!.solutionDescription;
        _attentionOrderArguments.attentionWorkDuration = response.order!.attentionWorkDuration;
        _attentionOrderArguments.customerName = response.order!.customerName;
        _attentionOrderArguments.requestCause = response.order!.requestCause;
        _attentionOrderArguments.priority = response.order!.priority;
        _attentionOrderArguments.customerPhone = response.order!.customerPhone;
        _attentionOrderArguments.customerAddress = response.order!.customerAddress;
        _attentionOrderArguments.customerAddressUrl = response.order!.customerAddressUrl;
        _attentionOrderArguments.orderRequestedDate = response.order!.orderRequestedDate;
        _attentionOrderArguments.orderRealInitDate = response.order!.orderRealInitDate;
        _attentionOrderArguments.orderRealFinDate = response.order!.orderRealFinDate;
        _attentionOrderArguments.orderAccordanceDate = response.order!.orderAccordanceDate;
        _setupReactiveStrings();
      } else { ErrorUtil.errorDialog(response.responseMessage!); }
    }
  }

  void _setupReactiveStrings() {
    _rxOrderRequestedDate.value = _attentionOrderArguments.orderRequestedDate ?? '';
    _rxOrderState.value = _attentionOrderArguments.orderState ?? '';
    _rxCustomerName.value = _attentionOrderArguments.customerName ?? '';
    _rxCustomerTelephone.value = _attentionOrderArguments.customerPhone ?? '';
    _rxCustomerAddress.value = _attentionOrderArguments.customerAddress ?? '';
    _rxEquipmentCode.value = _attentionOrderArguments.equipmentCode ?? '';
    _rxEquipmentName.value = _attentionOrderArguments.equipmentName ?? '';
    _rxRequestCause.value = _attentionOrderArguments.requestCause ?? '';
    _rxOrderRealInitDate.value = _attentionOrderArguments.orderRealInitDate ?? '';
    update();
  }

  void processStep1() async {
    Get.dialog(const DialogLoader(), barrierDismissible: false);
    RequestStep1 request = RequestStep1(
      orderId: _attentionOrderArguments.orderId,
      equipmentId: _attentionOrderArguments.equipmentId,
      orderRealInitialDate: _attentionOrderArguments.orderRealInitDate
    );
    ResponseStep1? response = await _orderRepository.updateOrderStep1(request: request);
    if(response != null) {
      Get.back();
      if(response.success!) {
        _goToStep2();
      } else { ErrorUtil.errorDialog(response.responseMessage!); }
    }
  }

  void _goToStep2() {
    Get.toNamed(AppRoutes.ATTENTION_ORDER_STEP_2, arguments: _attentionOrderArguments);
  }

  void startAttention() {
    if(_attentionOrderArguments.orderRealInitDate == null) {
      _attentionOrderArguments.orderRealInitDate = DateTime.now().toString();
      _rxOrderRealInitDate.value = _attentionOrderArguments.orderRealInitDate!;
    }
  }
}