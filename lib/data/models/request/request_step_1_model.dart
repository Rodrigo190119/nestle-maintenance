import 'package:flutter_maintenance/commons/utils/helpers.dart';

class RequestStep1 {
  int? orderId;
  int? equipmentId;
  String? orderRealInitialDate;

  RequestStep1({
    this.orderId,
    this.equipmentId,
    this.orderRealInitialDate
  });

  Map<String, dynamic> toJson() {
    return {
      'id': orderId,
      'equipment_id': equipmentId,
      'date_start_execution': Helpers.getFormattedDateTimeForRequest(orderRealInitialDate),
      'actstartdate': Helpers.getFormattedDateTimeForRequest(orderRealInitialDate),
    };
  }
}