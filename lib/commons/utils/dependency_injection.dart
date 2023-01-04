import 'package:dio/dio.dart';
import 'package:flutter_maintenance/commons/environment/environment.dart';
import 'package:flutter_maintenance/commons/utils/network_util.dart';
import 'package:flutter_maintenance/data/repository/order_repository.dart';
import 'package:flutter_maintenance/data/repository/user_repository.dart';
import 'package:flutter_maintenance/data/services/order_services.dart';
import 'package:flutter_maintenance/data/services/user_services.dart';
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
    //-------------REPOSITORIES -------------------
    Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);
    Get.lazyPut<OrderRepository>(() => OrderRepository(), fenix: true);
  }
}