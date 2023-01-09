class RequestEquipment {
  int? equipmentId;

  RequestEquipment({this.equipmentId});

  Map<String, dynamic> toJson() {
    return {
      'id': equipmentId
    };
  }
}