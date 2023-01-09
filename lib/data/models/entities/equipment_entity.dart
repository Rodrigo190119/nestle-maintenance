import 'package:flutter_maintenance/commons/utils/app_constants.dart';

class EquipmentEntity {
  int? equipmentId;
  String? equipmentName;
  String? equipmentCode;

  EquipmentEntity({
    this.equipmentId,
    this.equipmentName,
    this.equipmentCode,
  });

  factory EquipmentEntity.fromJson(Map<String, dynamic> json) {
    return EquipmentEntity(
      equipmentId: json['id'],
      equipmentName: json['name'],
      equipmentCode: json['equipment_number'],
    );
  }

  factory EquipmentEntity.fromDatabase(Map<String, dynamic> json) {
    return EquipmentEntity(
      equipmentId: json[AppConstants.EQUIPMENT_TABLE_ID],
      equipmentName: json[AppConstants.EQUIPMENT_TABLE_NAME],
      equipmentCode: json[AppConstants.EQUIPMENT_TABLE_CODE],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppConstants.EQUIPMENT_TABLE_ID: equipmentId,
      AppConstants.EQUIPMENT_TABLE_NAME: equipmentName,
      AppConstants.EQUIPMENT_TABLE_CODE: equipmentCode
    };
  }
}