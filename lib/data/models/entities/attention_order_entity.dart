class AttentionOrderEntity {
  int? id;
  String? orderNumber;
  String? orderState;
  int? equipmentId;
  String? equipmentName;
  String? equipmentCode;

  DateTime? orderRealInitDate;
  DateTime? orderRealFinDate;
  DateTime? orderAccordanceDate;

  AttentionOrderEntity({
    this.id,
    this.orderNumber,
    this.orderState,
    this.equipmentId,
    this.equipmentName,
    this.equipmentCode,
    this.orderRealInitDate,
    this.orderRealFinDate,
    this.orderAccordanceDate,
  });

  factory AttentionOrderEntity.fromJson(Map<String, dynamic> json) {
    return AttentionOrderEntity(

    );
  }
}