import 'package:flutter_maintenance/commons/utils/app_constants.dart';

class EquipmentTable {
  static String create() {
    return '''
      CREATE TABLE ${AppConstants.EQUIPMENT_TABLE} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ${AppConstants.EQUIPMENT_TABLE_ID} INTEGER,
        ${AppConstants.EQUIPMENT_TABLE_NAME} TEXT,
        ${AppConstants.EQUIPMENT_TABLE_CODE} TEXT
      )
    ''';
  }
}