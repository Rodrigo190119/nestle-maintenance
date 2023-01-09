import 'package:dio/dio.dart';
import 'package:flutter_maintenance/commons/environment/environment.dart';
import 'package:flutter_maintenance/commons/utils/network_util.dart';
import 'package:flutter_maintenance/data/repository/equipment_repository.dart';
import 'package:flutter_maintenance/data/repository/order_repository.dart';
import 'package:flutter_maintenance/data/repository/user_repository.dart';
import 'package:flutter_maintenance/data/services/equipment_services.dart';
import 'package:flutter_maintenance/data/services/order_services.dart';
import 'package:flutter_maintenance/data/services/user_services.dart';
import 'package:flutter_maintenance/database/database_repositories/equipment_database_repository.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void load(){
    //-------------NETWORK -----------------------
    Get.lazyPut<Dio>(
            () => Dio(BaseOptions(
            baseUrl: Environment.appConfig["baseUrl"],
            connectTimeout: Environment.appConfig["connectTimeout"])),
        fenix: true);
    Get.lazyPut<NetworkUtil>(() => NetworkUtil(), fenix: true);
    //-------------SERVICES -----------------------
    Get.lazyPut<UserServices>(() => UserServices(), fenix: true);
    Get.lazyPut<OrderServices>(() => OrderServices(), fenix: true);
    Get.lazyPut<EquipmentServices>(() => EquipmentServices(), fenix: true);
    //-------------REPOSITORIES -------------------
    Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);
    Get.lazyPut<OrderRepository>(() => OrderRepository(), fenix: true);
    Get.lazyPut<EquipmentRepository>(() => EquipmentRepository(), fenix: true);
    //-------------DATABASE REPOSITORIES ----------
    Get.lazyPut<EquipmentDatabaseRepository>(() => EquipmentDatabaseRepository(), fenix: true);
  }
}