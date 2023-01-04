class HomeOrderEntity {
  int? id;
  String? orderNumber;
  String? orderState;
  String? requestedDate;
  String? customerName;
  String? equipmentName;
  String? requestCause;
  String? priority;
  String? customerPhone;
  String? customerAddress;

  HomeOrderEntity({
    this.id,
    this.orderNumber,
    this.orderState,
    this.requestedDate,
    this.customerName,
    this.equipmentName,
    this.requestCause,
    this.priority,
    this.customerPhone,
    this.customerAddress,
  });

  factory HomeOrderEntity.fromJson(Map<String, dynamic> json) {
    return HomeOrderEntity(
      id: json['id'],
      orderNumber: json['name'],
      orderState: json['state'],
      requestedDate: json['requested_date'],
      customerName: json['customer_name'],
      equipmentName: json['equipment_name'],
      requestCause: json['request_cause'],
      priority: json['maintenance_priority'],
      customerPhone: json['report_phone'],
      customerAddress: json['address_url'],
    );
  }
}