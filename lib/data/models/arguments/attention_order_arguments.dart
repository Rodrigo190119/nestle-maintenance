class AttentionOrderArguments {
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

  AttentionOrderArguments({
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
}