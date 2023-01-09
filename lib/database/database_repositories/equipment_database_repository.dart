import 'dart:developer';

import 'package:flutter_maintenance/commons/utils/app_constants.dart';
import 'package:flutter_maintenance/data/models/entities/equipment_entity.dart';
import 'package:flutter_maintenance/database/maintenance_order_database.dart';
import 'package:sqflite/sqflite.dart';

class EquipmentDatabaseRepository {
  final _db = MaintenanceOrderDatabase.instance;

  Future<void> insertAllEquipmentsFromZip(List<EquipmentEntity> equipments) async {
    Database db = await _db.database;
    Batch batch = db.batch();
    for (EquipmentEntity equipment in equipments) {
      batch.insert(
        AppConstants.EQUIPMENT_TABLE,
        equipment.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<void> getLastEquipmentIdFromDatabase() async{
    Database db = await _db.database;
    int id = -1;
    List<Map> data = await db.query(
      AppConstants.EQUIPMENT_TABLE,
      orderBy: '${AppConstants.EQUIPMENT_TABLE_ID} DESC',
      limit: 1
    );
    if (data.isNotEmpty) {
      id =  data.first[AppConstants.EQUIPMENT_TABLE_ID];
    }
  }
}