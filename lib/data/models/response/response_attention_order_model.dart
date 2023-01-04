import 'package:flutter_maintenance/data/models/entities/attention_order_entity.dart';

class ResponseAttentionOrder {
  bool? success;
  String? responseMessage;
  AttentionOrderEntity? attention;

  ResponseAttentionOrder({
    this.success = false,
    this.responseMessage = '',
    this.attention
  });

  factory ResponseAttentionOrder.fromJson(Map<String, dynamic> json) {
    return ResponseAttentionOrder(
      success: json['success'],
      responseMessage: json['msg'],
      attention: json['result'] != null ? AttentionOrderEntity.fromJson(json['result']) : null
    );
  }
}