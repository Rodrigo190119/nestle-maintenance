import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter_maintenance/commons/utils/error_util.dart';
import 'package:flutter_maintenance/data/models/request/request_equipment_model.dart';
import 'package:flutter_maintenance/data/models/response/response_equipment_model.dart';
import 'package:flutter_maintenance/data/services/equipment_services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class EquipmentRepository {
  final EquipmentServices _equipmentServices = Get.find<EquipmentServices>();

  Future<ResponseEquipment?> getLastEquipments({required RequestEquipment request}) async {
    try {
      return await _equipmentServices.getLastEquipments(request: request);
    } catch (_) {
      Get.back();
      ErrorUtil.errorDialog((_.toString()));
      return null;
    }
  }

  Future<ResponseEquipment?> getEquipmentsZip() async {
    try {
      final responseInBytes = await _equipmentServices.getEquipmentsZip();
      Uint8List bodyBytes = responseInBytes;
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      String filePath = '$tempPath/odoo_info.zip';
      await File(filePath).writeAsBytes(bodyBytes.buffer.asUint8List(bodyBytes.offsetInBytes, bodyBytes.lengthInBytes));
      File zipFile = File(filePath);
      Directory destinationDir = Directory('$tempPath/odoo_info');
      //Check if file exists to delete it
      if(File('$tempPath/odoo_info/mro_equipment.json').existsSync()) {
        File('$tempPath/odoo_info/mro_equipment.json').deleteSync(recursive: true);
      }
      await ZipFile.extractToDirectory(zipFile: zipFile, destinationDir: destinationDir);
      String stringEquipmentList = await File('$tempPath/odoo_info/mro_equipment.json').readAsString();
      //Delete temps
      destinationDir.deleteSync(recursive: true);
      tempDir.deleteSync(recursive: true);
      final jsonEquipmentList = jsonDecode(stringEquipmentList);
      return ResponseEquipment.fromZip(jsonEquipmentList);
    } catch (_) {
      log(_.toString());
      return null;
    }
  }
}