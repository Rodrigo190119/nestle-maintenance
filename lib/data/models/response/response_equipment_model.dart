import 'package:flutter_maintenance/data/models/entities/equipment_entity.dart';

class ResponseEquipment {
  bool? success;
  String? responseMessage;

  List<EquipmentEntity>? equipmentEntityList;
  int? count;

  ResponseEquipment({
    this.success,
    this.responseMessage = '',
    this.equipmentEntityList,
    this.count = 0,
  });

  factory ResponseEquipment.fromJson(Map<String, dynamic> json) {
    return ResponseEquipment(
      success: json['success'],
      responseMessage: json['msg'],
      equipmentEntityList: List<EquipmentEntity>.from((json['result'] ?? [])
          .map((e) => EquipmentEntity.fromJson(e))),
      count: json['count']
    );
  }

  factory ResponseEquipment.fromZip(List<dynamic> json) {
    return ResponseEquipment(
      equipmentEntityList: List<EquipmentEntity>.from(json
        .map((e) => EquipmentEntity.fromJson(e))),
    );
  }
}