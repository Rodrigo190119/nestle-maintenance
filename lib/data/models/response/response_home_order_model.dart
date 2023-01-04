import 'package:flutter_maintenance/data/models/entities/home_order_entity.dart';

class ResponseHomeOrder {
  bool? success;
  String? responseMessage;

  List<HomeOrderEntity>? homeOrderEntityList;
  int? count;

  ResponseHomeOrder({
    this.success = false,
    this.responseMessage = '',
    this.homeOrderEntityList,
    this.count = 0,
  });

  factory ResponseHomeOrder.fromJson(Map<String, dynamic> json) {
    return ResponseHomeOrder(
      success: json['success'],
      responseMessage: json['msg'],
      homeOrderEntityList: List<HomeOrderEntity>.from((json['result'] ?? [])
          .map((e) => HomeOrderEntity.fromJson(e))),
      count: json['count']
    );
  }
}