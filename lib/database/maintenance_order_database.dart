import 'package:flutter_maintenance/database/database_tables/equipment_table.dart';
import 'package:sqflite/sqflite.dart';

class MaintenanceOrderDatabase {
  static final MaintenanceOrderDatabase instance = MaintenanceOrderDatabase._init();
  static Database? _database;

  MaintenanceOrderDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('orders.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    return await openDatabase(
      filePath,
      version: 1,
      onCreate: _createDB,
      onConfigure: _onConfigure
    );
  }

  void _createDB(Database database, int version) async {
    await database.execute(EquipmentTable.create());
  }

  void _onConfigure(Database db) async {
    await db.execute('PRAGMA encoding = "UTF-8";');
  }
}