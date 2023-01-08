import 'package:flutter_maintenance/data/models/entities/attention_order_entity.dart';

class ResponseAttentionOrder {
  bool? success;
  String? responseMessage;
  AttentionOrderEntity? order;

  ResponseAttentionOrder({
    this.success = false,
    this.responseMessage = '',
    this.order
  });

  factory ResponseAttentionOrder.fromJson(Map<String, dynamic> json) {
    return ResponseAttentionOrder(
      success: json['success'],
      responseMessage: json['msg'],
      order: json['result'] != null ? AttentionOrderEntity.fromJson(json['result']) : null
    );
  }
}