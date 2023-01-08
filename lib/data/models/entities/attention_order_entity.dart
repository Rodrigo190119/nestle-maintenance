class AttentionOrderEntity {
  int? orderId;
  String? orderNumber;
  String? orderState;
  int? equipmentId;
  String? equipmentName;
  String? equipmentCode;
  double? temperature;
  int? failureId;
  int? problemId;
  int? causeId;
  int? solutionId;
  String? failureDescription;
  String? problemDescription;
  String? causeDescription;
  String? solutionDescription;
  double? attentionWorkDuration;
  String? customerName;
  String? requestCause;
  String? priority;
  String? customerPhone;
  String? customerAddress;
  String? customerAddressUrl;
  String? orderRequestedDate;
  String? orderRealInitDate;
  String? orderRealFinDate;
  String? orderAccordanceDate;

  AttentionOrderEntity({
    this.orderId,
    this.orderNumber,
    this.orderState,
    this.equipmentId,
    this.equipmentName,
    this.equipmentCode,
    this.temperature,
    this.failureId,
    this.problemId,
    this.causeId,
    this.solutionId,
    this.failureDescription,
    this.problemDescription,
    this.causeDescription,
    this.solutionDescription,
    this.attentionWorkDuration,
    this.customerName,
    this.requestCause,
    this.priority,
    this.customerPhone,
    this.customerAddress,
    this.customerAddressUrl,
    this.orderRequestedDate,
    this.orderRealInitDate,
    this.orderRealFinDate,
    this.orderAccordanceDate,
  });

  factory AttentionOrderEntity.fromJson(Map<String, dynamic> json) {
    return AttentionOrderEntity(
      orderId: json['id'],
      orderNumber: json['name'],
      orderState: json['state'],
      equipmentId: json['equipment_id'],
      equipmentName: json['equipment_name'],
      equipmentCode: json['equipment_number'],
      temperature: json['temperature'],
      failureId: json['failureclass_id'],
      problemId: json['problem_id'],
      causeId: json['cause_id'],
      solutionId: json['solution_id'],
      failureDescription: json['failureclass_name'],
      problemDescription: json['problem_name'],
      causeDescription: json['cause_name'],
      solutionDescription: json['solution_name'],
      attentionWorkDuration: json['actual_duration'],
      customerName: json['customer_name'],
      requestCause: json['request_cause'],
      priority: json['maintenance_priority'],
      customerPhone: json['report_phone'],
      customerAddress: json['address'],
      customerAddressUrl: json['address_url'],
      orderRequestedDate: json['requested_date'],
      orderRealInitDate: json['actstartdate'],
      orderRealFinDate: json['actfinishdate'],
      orderAccordanceDate: json['accordancedate'],
    );
  }
}