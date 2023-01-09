import 'package:flutter_maintenance/commons/utils/network_util.dart';
import 'package:flutter_maintenance/data/models/request/request_equipment_model.dart';
import 'package:flutter_maintenance/data/models/response/response_equipment_model.dart';
import 'package:get/get.dart';

class EquipmentServices {
  final NetworkUtil _networkUtil = Get.find<NetworkUtil>();

  Future<ResponseEquipment> getLastEquipments({required RequestEquipment request}) async {
    return _networkUtil.post(
      url: 'mro_equipment/simple',
      bodyRaw: request.toJson()
    ).then((res) => ResponseEquipment.fromJson(res));
  }

  Future<dynamic> getEquipmentsZip() {
    return _networkUtil.get(
      url: 'mro_equipment/simple_zip',
      isBytes: true
    ).then((res) => res);
  }
}